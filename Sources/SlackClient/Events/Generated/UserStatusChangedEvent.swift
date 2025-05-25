#if Events
import Foundation
import SlackModels

public struct UserStatusChangedEvent: SlackEvent {
    public var type: Swift.String?
    public var user: SlackModels.User?
    public var cacheTs: Swift.Int?
    public var eventTs: Swift.String?
}
#endif
