#if Events
import Foundation
import SlackModels

public struct LinkSharedEvent: SlackEvent {
    public var channel: Swift.String?
    public var eventTs: Swift.String?
    public var isBotUserMember: Swift.Bool?
    public var links: [SlackModels.Link]?
    public var messageTs: Swift.String?
    public var source: Swift.String?
    public var threadTs: Swift.String?
    public var _type: Swift.String
    public var unfurlId: Swift.String?
    public var user: Swift.String?
    public enum CodingKeys: String, CodingKey {
        case channel
        case eventTs = "event_ts"
        case isBotUserMember = "is_bot_user_member"
        case links
        case messageTs = "message_ts"
        case source
        case threadTs = "thread_ts"
        case _type = "type"
        case unfurlId = "unfurl_id"
        case user
    }
}
#endif
