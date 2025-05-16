import Foundation
import OpenAPIRuntime
import HTTPTypes

public actor Slack {
    public let client: APIProtocol
    private var requestConfigurationMiddleware: RequestConfigurationMiddlware

    public init(
        serverURL: URL = URL(string: "https://slack.com/api")!,
        transport: any ClientTransport,
        middlewares: [any ClientMiddleware] = [],
        configuration: ClientConfiguration = .init()
    ) {
        requestConfigurationMiddleware = RequestConfigurationMiddlware(configuration: configuration)
        self.client = Client(
            serverURL: serverURL,
            transport: transport,
            middlewares: middlewares + [requestConfigurationMiddleware]
        )
    }

    public func setAccessToken(_ value: String) async {
        await requestConfigurationMiddleware.setAccessToken(value)
    }
}

extension Slack {
    public struct ClientConfiguration: Sendable {
        public var userAgent: String?
        public var accessToken: String?

        public init(
            userAgent: String? = nil,
            accessToken: String? = nil
        ) {
            self.userAgent = userAgent
            self.accessToken = accessToken
        }
    }
}


extension Slack {
    private actor RequestConfigurationMiddlware: ClientMiddleware {
        private var additionalHeaderFields: HTTPFields = .init()

        private var configuration: ClientConfiguration {
            didSet {
                self.additionalHeaderFields = Self.updateAdditionalHeaders(configuration)
            }
        }

        init(configuration: ClientConfiguration) {
            self.configuration = configuration
            self.additionalHeaderFields = Self.updateAdditionalHeaders(configuration)
        }

        static func updateAdditionalHeaders(_ configuration: ClientConfiguration) -> HTTPFields {
            var additionalHeaderFields = HTTPFields()
            additionalHeaderFields[.userAgent] = configuration.userAgent
            if let accessToken = configuration.accessToken {
                additionalHeaderFields[.authorization] = "Bearer \(accessToken)"
            }
            return additionalHeaderFields
        }

        func setAccessToken(_ value: String) {
            configuration.accessToken = value
        }

        func intercept(
            _ request: HTTPRequest,
            body: HTTPBody?,
            baseURL: URL,
            operationID: String,
            next: (HTTPRequest, HTTPBody?, URL) async throws -> (HTTPResponse, HTTPBody?)
        ) async throws -> (
            HTTPResponse,
            HTTPBody?
        ) {
            var req = request
            req.headerFields.append(contentsOf: additionalHeaderFields)
            return try await next(req, body, baseURL)
        }
    }
}
