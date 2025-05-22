import Foundation
import HTTPTypes
import OpenAPIRuntime

actor RequestConfigurationMiddlware: ClientMiddleware {
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
