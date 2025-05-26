#if Events
import Foundation
import SlackModels

public struct TokensRevokedEvent: SlackEvent {
    public var tokens: SlackModels.Tokens?
    public var type: Swift.String?
}
#endif
