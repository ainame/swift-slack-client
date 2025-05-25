#if Events
import Foundation

public struct UserChangeEvent: SlackEvent {
    public var type: Swift.String?
    public var user: Components.Schemas.User?
    public var cacheTs: Swift.Int?
}
#endif
