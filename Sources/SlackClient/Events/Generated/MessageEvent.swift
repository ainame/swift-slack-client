#if Events
import Foundation
import SlackModels
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

public struct MessageEvent: SlackEvent {
    public var attachments: [SlackModels.Attachment]?
    public var blocks: [BlockType]?
    public var botId: Swift.String?
    public var botProfile: SlackModels.BotProfile?
    public var channel: Swift.String?
    public var channelType: Swift.String?
    public var clientMsgId: Swift.String?
    public var edited: SlackModels.Edited?
    public var eventTs: Swift.String?
    public var metadata: SlackModels.MessageEventMetadata?
    public var parentUserId: Swift.String?
    public var team: Swift.String?
    public var text: Swift.String?
    public var threadTs: Swift.String?
    public var ts: Swift.String?
    public var _type: Swift.String
    public var user: Swift.String?
    public enum CodingKeys: String, CodingKey {
        case attachments
        case blocks
        case botId = "bot_id"
        case botProfile = "bot_profile"
        case channel
        case channelType = "channel_type"
        case clientMsgId = "client_msg_id"
        case edited
        case eventTs = "event_ts"
        case metadata
        case parentUserId = "parent_user_id"
        case team
        case text
        case threadTs = "thread_ts"
        case ts
        case _type = "type"
        case user
    }
}
#endif
