#if Events
import Foundation

public struct MessageChannelUnarchiveEvent: SlackEvent {
    public var channel: Swift.String?
    public var channelType: Swift.String?
    public var eventTs: Swift.String?
    public var subtype: Swift.String?
    public var team: Swift.String?
    public var text: Swift.String?
    public var ts: Swift.String?
    public var _type: Swift.String
    public var user: Swift.String?
    public enum CodingKeys: String, CodingKey {
        case channel
        case channelType = "channel_type"
        case eventTs = "event_ts"
        case subtype
        case team
        case text
        case ts
        case _type = "type"
        case user
    }
}
#endif
