import Foundation
import SlackBlockKit
import SlackModels

public struct ViewClosedPayload: InteractivePayloadProtocol, Decodable, Sendable {
    public let type: String // view_closed
    public let team: Team
    public let user: User
    public let view: ViewType
    public let isCleared: Bool
}

extension ViewClosedPayload {
    public var callbackId: String? { view.callbackId }
}
