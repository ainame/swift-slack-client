import Foundation
import SlackBlockKit

/// Provides acknowledgment functionality for Slack app interactions.
public struct Ack: Sendable {
    private let basicHandler: @Sendable () async throws -> Void
    private let viewHandler: @Sendable (ResponseAction, View) async throws -> Void
    private let errorHandler: @Sendable ([String: String]) async throws -> Void

    init(
        basicHandler: @Sendable @escaping () async throws -> Void,
        viewHandler: @Sendable @escaping (ResponseAction, View) async throws -> Void,
        errorHandler: @Sendable @escaping ([String: String]) async throws -> Void,
    ) {
        self.basicHandler = basicHandler
        self.viewHandler = viewHandler
        self.errorHandler = errorHandler
    }

    public func callAsFunction() async throws {
        try await basicHandler()
    }

    public func callAsFunction(responseAction: ResponseAction, view: View) async throws {
        try await viewHandler(responseAction, view)
    }

    public func callAsFunction(errors: [String: String]) async throws {
        try await errorHandler(errors)
    }
}

extension Ack {
    public enum ResponseAction: String, Sendable {
        case update
        case push
        case clear
    }
}
