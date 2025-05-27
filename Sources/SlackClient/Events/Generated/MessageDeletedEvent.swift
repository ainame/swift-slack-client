#if Events
import Foundation
import SlackModels

public struct MessageDeletedEvent: SlackEvent {
    public var channel: Swift.String?
    public var channelType: Swift.String?
    public var deletedTs: Swift.String?
    public var eventTs: Swift.String?
    public var hidden: Swift.Bool?
    public var previousMessage: SlackModels.Message?
    public var subtype: Swift.String?
    public var ts: Swift.String?
    public var _type: Swift.String
    public enum CodingKeys: String, CodingKey {
        case channel
        case channelType = "channel_type"
        case deletedTs = "deleted_ts"
        case eventTs = "event_ts"
        case hidden
        case previousMessage = "previous_message"
        case subtype
        case ts
        case _type = "type"
    }
}
#endif
