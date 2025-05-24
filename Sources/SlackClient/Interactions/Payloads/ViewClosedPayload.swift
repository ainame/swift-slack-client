import Foundation
import SlackBlockKit

public struct ViewClosedPayload: InteractivePayloadProtocol, Decodable, Sendable {
    public let type: String // view_closed
    public let team: Components.Schemas.Team
    public let user: Components.Schemas.User
    public let view: ViewType
    public let isCleared: Bool
}

extension ViewClosedPayload {
    public var callbackId: String? { view.callbackId }
}
