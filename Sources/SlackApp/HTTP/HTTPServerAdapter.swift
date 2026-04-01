import Foundation
import HTTPTypes

public typealias HTTPServerHandler =
    @Sendable (_ request: HTTPRequest, _ body: Foundation.Data) async throws -> (response: HTTPResponse, body: Foundation.Data?)

public protocol HTTPServerAdapter: Sendable {
    func run(handler: @escaping HTTPServerHandler) async throws
}
