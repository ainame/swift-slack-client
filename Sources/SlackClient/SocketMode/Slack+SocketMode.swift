#if SocketMode

import Foundation
import Logging
import NIOCore
import NIOFoundationCompat
import OpenAPIRuntime
import WSClient

extension Slack {
    /// Start SocketMode subscription. By default this will re-connect to Slack when the connection ends.
    ///
    /// - Parameters:
    ///   - options: Options to control behaviors
    ///   - appLogger: App specific logger that will be accessible from context param in router.
    ///   If not specified, the system logger will be available.
    public func runInSocketMode(
        options: SocketModeOptions = [
            .autoReconnectWhenDisconnected,
            .recoverFromAppError,
        ],
        logger appLogger: Logger? = nil,
    ) async throws {
        let routers = routers
        if routers.isEmpty {
            let app = App(slack: self, router: AppRouter(), mode: .socketMode(options: options, logger: appLogger))
            try await app.run()
            return
        }

        while true {
            if Task.isCancelled { break }

            let url = try await openConnection()
            try await startSocketMode(with: url, routers: routers, options: options, appLogger: appLogger)

            if !options.contains(.autoReconnectWhenDisconnected) { break }
        }
    }

    @available(*, deprecated, renamed: "AppRouter")
    public func addSocketModeRouter(_ router: SocketModeRouter) {
        routers.append(AppRouter.FixedRouter(from: router))
    }

    func openConnection() async throws -> String {
        await setToken(clientConfiguration.appToken)
        let result = try await client.appsConnectionsOpen(body: .json(.init()))
        await setToken(clientConfiguration.token)
        guard let url = try result.ok.body.json.url else {
            throw Error.genericError("invalid response body - no url found")
        }
        return url
    }

    func onMessageRecieved(_ buffer: ByteBuffer) async throws -> SocketModeMessage {
        do {
            let messageType = try jsonDecoder.decode(SocketModeMessage.self, from: buffer)
            switch messageType.body {
            case let .hello(message):
                logger.info("\(message)")
            case let .disconnect(message):
                logger.info("\(message)")
            case .message:
                break
            }
            return messageType
        } catch {
            let message = String(buffer: buffer)
            logger.error("Parsing message failed: \(error) /// \(message)")
            throw error
        }
    }

    private func startSocketMode(
        with url: String,
        routers: [AppRouter.FixedRouter],
        options: SocketModeOptions,
        appLogger: Logger?,
    ) async throws {
        let client = client
        let transport = transport
        let logger = logger
        let runtimeLogger = appLogger ?? logger

        let ws = WebSocketClient(url: url, logger: logger) { inbound, outbound, context in
            context.logger.info("SocketMode client connected")
            await self.setWebSocketOutboundWriter(outbound)

            try await withThrowingDiscardingTaskGroup { group in
                for try await frame in inbound {
                    guard frame.opcode == .text else { continue }

                    let message = try await self.onMessageRecieved(frame.data)
                    guard case let .message(envelope) = message.body else { continue }

                    if case .eventsApi = envelope.payload {
                        try await SocketModeAcknowledger.sendBasicAck(
                            envelopeId: envelope.envelopeId,
                            writer: outbound,
                        )
                    }

                    group.addTask {
                        let request = switch envelope.payload {
                        case let .interactive(payload):
                            AppRequest.interactive(payload)
                        case let .slashCommands(payload):
                            AppRequest.slashCommand(payload)
                        #if Events
                        case let .eventsApi(payload):
                            AppRequest.event(payload)
                        #endif
                        case let .unsupported(type):
                            AppRequest.unsupported(type)
                        }

                        let appContext = AppContext(
                            client: client,
                            logger: runtimeLogger,
                            respond: Respond(transport: transport, logger: logger),
                            say: Say(client: client, logger: logger),
                            ack: SocketModeAcknowledger.makeAck(
                                envelopeId: envelope.envelopeId,
                                writer: outbound,
                            ),
                        )

                        do {
                            for router in routers {
                                try await router.dispatch(context: appContext, request: request)
                            }
                        } catch {
                            context.logger.error("App Level Error: \(error)")
                            if !options.contains(.recoverFromAppError) {
                                throw error
                            }
                        }
                    }
                }
            }

            context.logger.info("SocketMode client disconnected")
        }

        try await ws.run()
    }

    private func setWebSocketOutboundWriter(_ webSocketOutboundWriter: WebSocketOutboundWriter) {
        socketModeState = .ready(webSocketOutboundWriter)
    }
}

#endif
