import Foundation
import HTTPTypes
import Logging
import OpenAPIRuntime
#if SocketMode
import WSClient
#endif

public final class App {
    public enum RunMode: Sendable {
        #if SocketMode
        case socketMode(options: SocketModeOptions = [.autoReconnectWhenDisconnected, .recoverFromAppError], logger: Logger? = nil)
        #endif
        case http(any HTTPServerAdapter)
    }

    private let slack: Slack
    private let router: AppRouter
    private let mode: RunMode

    public init(slack: Slack, router: AppRouter, mode: RunMode) {
        self.slack = slack
        self.router = router
        self.mode = mode
    }

    public convenience init(
        serverURL: URL = URL(string: "https://slack.com/api")!,
        transport: any ClientTransport,
        middlewares: [any ClientMiddleware] = [],
        logger: Logger? = nil,
        configuration: ClientConfiguration = .init(),
        router: AppRouter,
        mode: RunMode,
    ) {
        self.init(
            slack: Slack(
                serverURL: serverURL,
                transport: transport,
                middlewares: middlewares,
                logger: logger,
                configuration: configuration,
            ),
            router: router,
            mode: mode,
        )
    }

    public func run() async throws {
        switch mode {
        #if SocketMode
        case let .socketMode(options, logger):
            try await runSocketMode(options: options, appLogger: logger)
        #endif
        case let .http(adapter):
            try await runHTTP(with: adapter)
        }
    }
}

#if SocketMode
extension App {
    private func runSocketMode(options: SocketModeOptions, appLogger: Logger?) async throws {
        while true {
            if Task.isCancelled { break }

            let url = try await slack.openConnection()
            try await startSocketMode(with: url, options: options, appLogger: appLogger)

            if !options.contains(.autoReconnectWhenDisconnected) { break }
        }
    }

    private func startSocketMode(with url: String, options: SocketModeOptions, appLogger: Logger?) async throws {
        let router = AppRouter.FixedRouter(from: router)
        let client = slack.client
        let transport = slack.transport
        let logger = slack.logger
        let runtimeLogger = appLogger ?? logger
        let slack = self.slack

        let ws = WebSocketClient(url: url, logger: logger) { inbound, outbound, context in
            context.logger.info("SocketMode client connected")

            try await withThrowingDiscardingTaskGroup { group in
                for try await frame in inbound {
                    guard frame.opcode == .text else { continue }

                    let message = try await slack.onMessageRecieved(frame.data)
                    guard case let .message(envelope) = message.body else { continue }

                    if case .eventsApi = envelope.payload {
                        try await SocketModeAcknowledger.sendBasicAck(
                            envelopeId: envelope.envelopeId,
                            writer: outbound,
                        )
                    }

                    let request = Self.request(from: envelope)
                    group.addTask {
                        let context = AppContext(
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
                            try await router.dispatch(context: context, request: request)
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

    private static func request(from envelope: SocketModeMessageEnvelope) -> AppRequest {
        switch envelope.payload {
        case let .interactive(payload):
            .interactive(payload)
        case let .slashCommands(payload):
            .slashCommand(payload)
        #if Events
        case let .eventsApi(payload):
            .event(payload)
        #endif
        case let .unsupported(type):
            .unsupported(type)
        }
    }
}
#endif

extension App {
    private func runHTTP(with adapter: any HTTPServerAdapter) async throws {
        let handler = AppHTTPHandler(slack: slack, router: router)
        try await adapter.run(handler: handler.handle)
    }
}
