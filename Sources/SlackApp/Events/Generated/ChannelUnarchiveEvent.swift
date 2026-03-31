#if Events
import Foundation

public struct ChannelUnarchiveEvent: SlackEvent {
    public var channel: Swift.String?
    public var eventTs: Swift.String?
    public var _type: Swift.String
    public var user: Swift.String?
    public enum CodingKeys: String, CodingKey {
        case channel
        case eventTs = "event_ts"
        case _type = "type"
        case user
    }
}
#endif
