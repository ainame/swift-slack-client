#if Events
import Foundation

public struct ChannelIDChangedEvent: SlackEvent {
    public var eventTs: Swift.String?
    public var newChannelId: Swift.String?
    public var oldChannelId: Swift.String?
    public var _type: Swift.String
    public enum CodingKeys: String, CodingKey {
        case eventTs = "event_ts"
        case newChannelId = "new_channel_id"
        case oldChannelId = "old_channel_id"
        case _type = "type"
    }
}
#endif
