import Foundation
import HTTPTypes
import OpenAPIRuntime

#if SocketMode
import NIOCore
import WSClient
#endif

public actor Slack {
    public let client: APIProtocol
    private var requestConfigurationMiddleware: RequestConfigurationMiddlware

    #if SocketMode
    private var socketMode: SocketMode = .notReady
    private let jsonEncoder: JSONEncoder = {
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

#if SocketMode
extension Slack {
    private enum SocketMode {
        case notReady
        case ready(WebSocketOutboundWriter)

        var writer: WebSocketOutboundWriter? {
            switch self {
            case .ready(let writer):
                return writer
            case .notReady:
                return nil
            }
        }
    }

    public func setWebSocketOutboundWrite(_ writer: WebSocketOutboundWriter) {
        socketMode = .ready(writer)
    }

    private func send(_ payload: Encodable) async throws {
        let data = try jsonEncoder.encode(payload)
        try await socketMode.writer?.write(.text(String(decoding: data, as: UTF8.self)))
    }

    public func onMessageRecieved(_ buffer: ByteBuffer) async throws -> SlackMessageWrapper {
        let payloadWrapper = try jsonDecoder.decode(SlackMessageWrapper.self, from: buffer)
        switch payloadWrapper.body {
        case .message(let payload):
            try await ack(payload)
        default:
            break
        }
        return payloadWrapper
    }
}
#endif
