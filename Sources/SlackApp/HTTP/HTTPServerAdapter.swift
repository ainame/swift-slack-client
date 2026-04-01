import Foundation
import HTTPTypes

public typealias HTTPServerResponseBody = Foundation.Data?
public typealias HTTPServerHandler = @Sendable (HTTPRequest, Foundation.Data) async throws -> (HTTPResponse, HTTPServerResponseBody)

public protocol HTTPServerAdapter: Sendable {
    func run(handler: @escaping HTTPServerHandler) async throws
}
