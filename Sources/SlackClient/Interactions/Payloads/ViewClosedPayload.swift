import Foundation
import SlackBlockKit
import SlackModels

public struct ViewClosedPayload: InteractivePayloadProtocol, Decodable, Sendable {
    /// "view_closed"
    public let _type: String
    public let team: Team
    public let user: User
    public let view: View
    public let isCleared: Bool

    private enum CodingKeys: String, CodingKey {
        case _type = "type"
        case team
        case user
        case view
        case isCleared = "is_cleared"
    }
}

extension ViewClosedPayload {
    public var callbackId: String? {
        view.callbackId
    }
}
