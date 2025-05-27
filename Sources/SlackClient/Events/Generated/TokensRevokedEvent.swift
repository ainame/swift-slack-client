#if Events
import Foundation
import SlackModels

public struct TokensRevokedEvent: SlackEvent {
    public var tokens: SlackModels.Tokens?
    public var _type: Swift.String
    public enum CodingKeys: String, CodingKey {
        case tokens
        case _type = "type"
    }
}
#endif
