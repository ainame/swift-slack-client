#if Events
import Foundation
import SlackModels

public struct UserProfileChangedEvent: SlackEvent {
    public var cacheTs: Swift.Int?
    public var eventTs: Swift.String?
    public var _type: Swift.String
    public var user: SlackModels.User?
    public enum CodingKeys: String, CodingKey {
        case cacheTs = "cache_ts"
        case eventTs = "event_ts"
        case _type = "type"
        case user
    }
}
#endif
