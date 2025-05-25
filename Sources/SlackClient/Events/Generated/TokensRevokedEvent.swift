#if Events
import Foundation

public struct TokensRevokedEvent: SlackEvent {
    public var type: Swift.String?
    public var tokens: Components.Schemas.Tokens?
}
#endif
