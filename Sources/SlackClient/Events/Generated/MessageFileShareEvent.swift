#if Events
import Foundation
import SlackModels
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

public struct MessageFileShareEvent: SlackEvent {
    public var attachments: [SlackModels.Attachment]?
    public var blocks: [Block]?
    public var channel: Swift.String?
    public var channelType: Swift.String?
    public var displayAsBot: Swift.Bool?
    public var eventTs: Swift.String?
    public var files: [SlackModels.File]?
    public var parentUserId: Swift.String?
    public var subtype: Swift.String?
    public var text: Swift.String?
    public var threadTs: Swift.String?
    public var ts: Swift.String?
    public var _type: Swift.String
    public var upload: Swift.Bool?
    public var user: Swift.String?
    public enum CodingKeys: String, CodingKey {
        case attachments
        case blocks
        case channel
        case channelType = "channel_type"
        case displayAsBot = "display_as_bot"
        case eventTs = "event_ts"
        case files
        case parentUserId = "parent_user_id"
        case subtype
        case text
        case threadTs = "thread_ts"
        case ts
        case _type = "type"
        case upload
        case user
    }
}
#endif
