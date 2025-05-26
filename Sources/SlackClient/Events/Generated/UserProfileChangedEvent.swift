#if Events
import Foundation
import SlackModels

public struct UserProfileChangedEvent: SlackEvent {
    public var cacheTs: Swift.Int?
    public var eventTs: Swift.String?
    public var type: Swift.String?
    public var user: SlackModels.User?
}
#endif
