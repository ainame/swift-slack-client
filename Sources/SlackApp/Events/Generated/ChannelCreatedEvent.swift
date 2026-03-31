#if Events
import Foundation
import SlackModels

public struct ChannelCreatedEvent: SlackEvent {
    public var channel: SlackModels.Channel?
    public var eventTs: Swift.String?
    public var _type: Swift.String
    public enum CodingKeys: String, CodingKey {
        case channel
        case eventTs = "event_ts"
        case _type = "type"
    }
}
#endif
