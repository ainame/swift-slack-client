import Foundation
import HTTPTypes

public struct HTTPServerRequest: Sendable {
    public var method: HTTPRequest.Method
    public var path: String
    public var headerFields: HTTPFields
    public var body: Data

    public init(method: HTTPRequest.Method, path: String, headerFields: HTTPFields = .init(), body: Data = Data()) {
        self.method = method
        self.path = path
        self.headerFields = headerFields
        self.body = body
    }
}

public struct HTTPServerResponse: Sendable {
    public var status: HTTPResponse.Status
    public var headerFields: HTTPFields
    public var body: Data?

    public init(status: HTTPResponse.Status, headerFields: HTTPFields = .init(), body: Data? = nil) {
        self.status = status
        self.headerFields = headerFields
        self.body = body
    }
}

public protocol HTTPServerAdapter: Sendable {
    func run(
        handler: @Sendable @escaping (HTTPServerRequest) async throws -> HTTPServerResponse
    ) async throws
}
