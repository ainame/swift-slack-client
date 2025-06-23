#if SocketMode

import Foundation
import HTTPTypes
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
        while true {
            if Task.isCancelled { break }

            let url = try await openConnection()
            try await doStartSocketMode(with: url, options: options, appLogger: appLogger)

            if !options.contains(.autoReconnectWhenDisconnected) { break }
        }
    }

    public func addSocketModeRouter(_ router: SocketModeRouter) {
        routers.append(SocketModeRouter.FixedRouter(from: router))
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

    func doStartSocketMode(with url: String, options: SocketModeOptions, appLogger: Logger?) async throws {
        // Context creation will be moved inside message handling to pass envelope-specific ack
        // Fix the set of routers to be routed before starting
        let routers = routers

        let ws = WebSocketClient(url: url, logger: logger) { [weak self] inbound, outbound, context in
            context.logger.info("SocketMode client connected")
            await self?.setWebSocketOutboundWriter(outbound)

            // Process each message as a structured task so that a long running handler won't block subsequent messages
            try await withThrowingDiscardingTaskGroup { group in
                for try await frame in inbound {
                    guard frame.opcode == .text,
                          let message = try await self?.onMessageRecieved(frame.data),
                          case let .message(envelope) = message.body else {
                        // Only handle meaningful messages
                        continue
                    }

                    group.addTask { [weak self] in
                        guard let self else { return }

                        // Create context with envelope-specific ack
                        let routerContext = SocketModeRouter.Context(
                            client: self.client,
                            logger: appLogger ?? self.logger,
                            respond: Respond(transport: self.transport, logger: self.logger),
                            say: Say(client: self.client, logger: self.logger),
                            ack: Ack(
                                envelopeId: envelope.envelopeId,
                                writer: outbound,
                                logger: self.logger,
                            ),
                        )

                        do {
                            for router in routers {
                                try await router.dispatch(context: routerContext, messageEnvelope: envelope)
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

    private func onMessageRecieved(_ buffer: ByteBuffer) async throws -> SocketModeMessage {
        do {
            let messageType = try jsonDecoder.decode(SocketModeMessage.self, from: buffer)
            switch messageType.body {
            case let .message(message):
                if case .eventsApi = message.payload {
                    // Events APIs should be acked right away
                    try await ack(message.envelopeId)
                }
            case let .hello(message):
                logger.info("\(message)")
            case let .disconnect(message):
                logger.info("\(message)")
            }
            return messageType
        } catch {
            let message = String(buffer: buffer)
            logger.error("Parsing message failed: \(error) /// \(message)")
            throw error
        }
    }

    private func ack(_ envelopeId: String) async throws {
        try await send(SocketModeAcknowledgementlMessage(envelopeId: envelopeId))
    }

    private func send(_ payload: Encodable) async throws {
        let data = try jsonEncoder.encode(payload)
        try await socketModeState.writer?.write(.text(String(decoding: data, as: UTF8.self)))
    }

    private func setWebSocketOutboundWriter(_ webSocketOutboundWriter: WebSocketOutboundWriter) {
        socketModeState = .ready(webSocketOutboundWriter)
    }
}

#endif
