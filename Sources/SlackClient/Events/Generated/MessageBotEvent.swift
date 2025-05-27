#if Events
import Foundation
import SlackModels
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

public struct MessageBotEvent: SlackEvent {
    public var attachments: [SlackModels.Attachment]?
    public var blocks: [BlockType]?
    public var botId: Swift.String?
    public var channel: Swift.String?
    public var channelType: Swift.String?
    public var eventTs: Swift.String?
    public var icons: SlackModels.Icons?
    public var subtype: Swift.String?
    public var text: Swift.String?
    public var threadTs: Swift.String?
    public var ts: Swift.String?
    public var _type: Swift.String
    public var username: Swift.String?
    public enum CodingKeys: String, CodingKey {
        case attachments
        case blocks
        case botId = "bot_id"
        case channel
        case channelType = "channel_type"
        case eventTs = "event_ts"
        case icons
        case subtype
        case text
        case threadTs = "thread_ts"
        case ts
        case _type = "type"
        case username
    }
}
#endif
