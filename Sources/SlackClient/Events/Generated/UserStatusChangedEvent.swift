#if Events
import Foundation

public struct UserStatusChangedEvent: SlackEvent {
    public var type: Swift.String?
    public var user: Components.Schemas.User?
    public var cacheTs: Swift.Int?
    public var eventTs: Swift.String?
}
#endif
