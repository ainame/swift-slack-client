#if Events
import Foundation
import SlackModels

public struct UserChangeEvent: SlackEvent {
    public var cacheTs: Swift.Int?
    public var _type: Swift.String
    public var user: SlackModels.User?
    public enum CodingKeys: String, CodingKey {
        case cacheTs = "cache_ts"
        case _type = "type"
        case user
    }
}
#endif
