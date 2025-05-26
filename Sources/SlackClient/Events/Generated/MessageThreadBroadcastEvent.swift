#if Events
import Foundation
import SlackModels
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

public struct MessageThreadBroadcastEvent: SlackEvent {
    public var attachments: [SlackModels.Attachment]?
    public var blocks: [BlockType]?
    public var channel: Swift.String?
    public var channelType: Swift.String?
    public var clientMsgId: Swift.String?
    public var eventTs: Swift.String?
    public var root: SlackModels.MessageRoot?
    public var subtype: Swift.String?
    public var text: Swift.String?
    public var threadTs: Swift.String?
    public var ts: Swift.String?
    public var type: Swift.String
    public var user: Swift.String?
}
#endif
