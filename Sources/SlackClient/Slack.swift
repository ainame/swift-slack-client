import Foundation
import HTTPTypes
import OpenAPIRuntime
import Logging

public actor Slack {
    public let client: APIProtocol
    let clientConfiguration: ClientConfiguration
    var requestMiddleware: RequestMiddlware
    let logger: Logger

    #if SocketMode
    var socketModeState: SocketModeState = .notReady
    let jsonEncoder: JSONEncoder = {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return encoder
    }()
    let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    #endif

    public init(
        serverURL: URL = URL(string: "https://slack.com/api")!,
        transport: any ClientTransport,
        middlewares: [any ClientMiddleware] = [],
        logger: Logger? = nil,
        configuration: ClientConfiguration = .init()
    ) {
        clientConfiguration = configuration
        requestMiddleware = RequestMiddlware(configuration: .init(
            accessToken: configuration.accessToken,
            userAgent: configuration.userAgent
        ))
        self.client = Client(
            serverURL: serverURL,
            transport: transport,
            middlewares: middlewares + [requestMiddleware]
        )
        self.logger = logger ?? Logger(label: "Slack")
    }

    public func setAccessToken(_ value: String) async {
        await requestMiddleware.setAccessToken(value)
    }
}
