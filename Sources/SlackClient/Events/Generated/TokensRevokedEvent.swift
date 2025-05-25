#if Events
import Foundation
import SlackModels

public struct TokensRevokedEvent: SlackEvent {
    public var type: Swift.String?
    public var tokens: SlackModels.Tokens?
}
#endif
