#if Events
import Foundation
import SlackModels
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

public struct MessageEkmAccessDeniedEvent: SlackEvent {
    public var attachments: [SlackModels.Attachment]?
    public var blocks: [BlockType]?
    public var channel: Swift.String?
    public var channelType: Swift.String?
    public var eventTs: Swift.String?
    public var hidden: Swift.Bool?
    public var subtype: Swift.String?
    public var text: Swift.String?
    public var ts: Swift.String?
    public var _type: Swift.String
    public var user: Swift.String?
    public enum CodingKeys: String, CodingKey {
        case attachments
        case blocks
        case channel
        case channelType = "channel_type"
        case eventTs = "event_ts"
        case hidden
        case subtype
        case text
        case ts
        case _type = "type"
        case user
    }
}
#endif
