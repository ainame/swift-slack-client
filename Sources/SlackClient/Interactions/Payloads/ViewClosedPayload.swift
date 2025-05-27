import Foundation
import SlackBlockKit
import SlackModels

public struct ViewClosedPayload: InteractivePayloadProtocol, Decodable, Sendable {
    public let type: String // view_closed
    public let team: Team
    public let user: User
    public let view: ViewType
    public let isCleared: Bool
    
    private enum CodingKeys: String, CodingKey {
        case type
        case team
        case user
        case view
        case isCleared = "is_cleared"
    }
}

extension ViewClosedPayload {
    public var callbackId: String? { view.callbackId }
}
