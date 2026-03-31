#if Events
import Foundation

public struct MessageMeEvent: SlackEvent {
    public var botId: Swift.String?
    public var channel: Swift.String?
    public var channelType: Swift.String?
    public var eventTs: Swift.String?
    public var subtype: Swift.String?
    public var text: Swift.String?
    public var ts: Swift.String?
    public var _type: Swift.String
    public var user: Swift.String?
    public var username: Swift.String?
    public enum CodingKeys: String, CodingKey {
        case botId = "bot_id"
        case channel
        case channelType = "channel_type"
        case eventTs = "event_ts"
        case subtype
        case text
        case ts
        case _type = "type"
        case user
        case username
    }
}
#endif
