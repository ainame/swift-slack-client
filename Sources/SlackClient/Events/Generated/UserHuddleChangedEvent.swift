#if Events
import Foundation

public struct UserHuddleChangedEvent: SlackEvent {
    public var type: Swift.String?
    public var user: Components.Schemas.User?
    public var cacheTs: Swift.Int?
    public var eventTs: Swift.String?
}
#endif
