import Foundation
import HTTPTypes
import OpenAPIRuntime

actor RequestMiddlware: ClientMiddleware {
    struct RequestConfiguration: Equatable {
        var token: String?
        var userAgent: String?
    }

    private var additionalHeaderFields: HTTPFields = .init()
    private var configuration: RequestConfiguration {
        didSet {
            additionalHeaderFields = Self.updateAdditionalHeaders(configuration)
        }
    }

    init(configuration: RequestConfiguration) {
        self.configuration = configuration
        additionalHeaderFields = Self.updateAdditionalHeaders(configuration)
    }

    static func updateAdditionalHeaders(_ configuration: RequestConfiguration) -> HTTPFields {
        var additionalHeaderFields = HTTPFields()
        additionalHeaderFields[.userAgent] = configuration.userAgent
        if let token = configuration.token {
            additionalHeaderFields[.authorization] = "Bearer \(token)"
        }
        return additionalHeaderFields
    }

    func setToken(_ value: String) {
        configuration.token = value
    }

    func intercept(
        _ request: HTTPRequest,
        body: HTTPBody?,
        baseURL: URL,
        operationID _: String,
        next: (HTTPRequest, HTTPBody?, URL) async throws -> (HTTPResponse, HTTPBody?),
    ) async throws -> (
        HTTPResponse,
        HTTPBody?,
    ) {
        var req = request
        req.headerFields.append(contentsOf: additionalHeaderFields)
        return try await next(req, body, baseURL)
    }
}
