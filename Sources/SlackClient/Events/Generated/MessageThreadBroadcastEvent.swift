#if Events
import Foundation
import SlackModels
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

public struct MessageThreadBroadcastEvent: SlackEvent {
    public var attachments: [SlackModels.Attachment]?
    public var blocks: [Block]?
    public var channel: Swift.String?
    public var channelType: Swift.String?
    public var clientMsgId: Swift.String?
    public var eventTs: Swift.String?
    public var root: SlackModels.MessageRoot?
    public var subtype: Swift.String?
    public var text: Swift.String?
    public var threadTs: Swift.String?
    public var ts: Swift.String?
    public var _type: Swift.String
    public var user: Swift.String?
    public enum CodingKeys: String, CodingKey {
        case attachments
        case blocks
        case channel
        case channelType = "channel_type"
        case clientMsgId = "client_msg_id"
        case eventTs = "event_ts"
        case root
        case subtype
        case text
        case threadTs = "thread_ts"
        case ts
        case _type = "type"
        case user
    }
}
#endif
