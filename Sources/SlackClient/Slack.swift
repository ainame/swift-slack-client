import Foundation
import HTTPTypes
import Logging
import OpenAPIRuntime

public actor Slack {
    public let client: APIProtocol
    let transport: any ClientTransport
    let clientConfiguration: ClientConfiguration
    var requestMiddleware: RequestMiddlware
    let logger: Logger

    public init(
        serverURL: URL = URL(string: "https://slack.com/api")!,
        transport: any ClientTransport,
        middlewares: [any ClientMiddleware] = [],
        logger: Logger? = nil,
        configuration: ClientConfiguration = .init()
    ) {
        clientConfiguration = configuration
        requestMiddleware = RequestMiddlware(configuration: .init(
            token: configuration.token,
            userAgent: configuration.userAgent,
        ))
        client = Client(
            serverURL: serverURL,
            transport: transport,
            middlewares: middlewares + [requestMiddleware],
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
