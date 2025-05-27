import Foundation
import SlackModels

public protocol InteractivePayloadProtocol: Decodable, Hashable, Sendable {
    var user: SlackModels.User { get }
    var callbackId: String? { get }
}

public enum InteractivePayload: Decodable, Hashable, Sendable {
    case blockActions(BlockActionsPaylaod)
    case shortcut(GlobalShortcutPayload)
    case viewSubmission(ViewSubmissionPayload)
    case viewClosed(ViewClosedPayload)
    case unsupported(String)
}

extension InteractivePayload {
    public var _type: String {
        switch self {
        case let .blockActions(payload): payload._type
        case let .shortcut(payload): payload._type
        case let .viewClosed(payload): payload._type
        case let .viewSubmission(payload): payload._type
        case let .unsupported(t): t
        }
    }
}
