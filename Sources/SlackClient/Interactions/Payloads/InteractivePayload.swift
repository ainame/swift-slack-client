import Foundation

public protocol InteractivePayloadProtocol: Sendable {
    var user: Components.Schemas.User { get }
    var callbackId: String? { get }
}

public enum InteractivePayload: Decodable, Sendable {
    case blockActions(BlockActionsPaylaod)
    case shortcut(GlobalShortcutPayload)
    case viewSubmission(ViewSubmissionPayload)
    case viewClosed(ViewClosedPayload)
    case unsupported(String)
}

extension InteractivePayload {
    public var type: String {
        switch self {
        case let .blockActions(payload): payload.type
        case let .shortcut(payload): payload.type
        case let .viewClosed(payload): payload.type
        case let .viewSubmission(payload): payload.type
        case let .unsupported(t): t
        }
    }
}
