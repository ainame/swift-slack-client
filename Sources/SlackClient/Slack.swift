import Foundation
import HTTPTypes
import Logging
import OpenAPIRuntime

/// The main Slack client providing access to Slack's Web API and Socket Mode functionality.
///
/// `Slack` is an actor-based client that provides type-safe access to Slack's APIs through
/// code generated from OpenAPI specifications. It supports both Web API calls and real-time
/// Socket Mode connections.
///
/// ## Usage
///
/// ### Basic Setup
/// ```swift
/// let client = Slack(
///     transport: URLSessionTransport(),
///     configuration: .init(token: "xoxb-your-bot-token")
/// )
/// ```
///
/// ### Web API Calls
/// ```swift
/// try await client.chatPostMessage(
///     channel: "#general",
///     text: "Hello from SwiftSlackClient!"
/// )
/// ```
///
/// ### Socket Mode
/// ```swift
/// let router = SocketModeRouter()
/// router.onSlashCommand("/hello") { context, payload in
///     try await context.client.chatPostMessage(
///         channel: payload.channelId,
///         text: "Hello, \(payload.userName)!"
///     )
/// }
///
/// await client.addSocketModeRouter(router)
/// try await client.runInSocketMode()
/// ```
public actor Slack {
    public let client: APIProtocol
    let transport: any ClientTransport
    let clientConfiguration: ClientConfiguration
    var requestMiddleware: RequestMiddlware
    let formEncodingMiddleware: FormEncodingMiddleware
    let logger: Logger

    public init(
        serverURL: URL = URL(string: "https://slack.com/api")!,
        transport: any ClientTransport,
        middlewares: [any ClientMiddleware] = [],
        logger: Logger? = nil,
        configuration: ClientConfiguration = .init(),
    ) {
        clientConfiguration = configuration
        requestMiddleware = RequestMiddlware(configuration: .init(
            token: configuration.token,
            userAgent: configuration.userAgent,
        ))
        formEncodingMiddleware = FormEncodingMiddleware()
        client = Client(
            serverURL: serverURL,
            transport: transport,
            middlewares: middlewares + [formEncodingMiddleware, requestMiddleware],
        )
        self.transport = transport
        self.logger = logger ?? Logger(label: "Slack")
    }

    public func setToken(_ value: String?) async {
        guard let value else { return }
        await requestMiddleware.setToken(value)
    }

    #if SocketMode
    var socketModeState: SocketModeState = .notReady
    var routers: [SocketModeRouter.FixedRouter] = []

    let jsonEncoder = JSONEncoder()
    let jsonDecoder = JSONDecoder()
    #endif
}
