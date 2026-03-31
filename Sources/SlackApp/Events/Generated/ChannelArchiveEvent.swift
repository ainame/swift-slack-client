#if Events
import Foundation

public struct ChannelArchiveEvent: SlackEvent {
    public var channel: Swift.String?
    public var eventTs: Swift.String?
    public var isMoved: Swift.Int?
    public var _type: Swift.String
    public var user: Swift.String?
    public enum CodingKeys: String, CodingKey {
        case channel
        case eventTs = "event_ts"
        case isMoved = "is_moved"
        case _type = "type"
        case user
    }
}
#endif
