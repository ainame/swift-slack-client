#if Events
import Foundation
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

public struct MessageEvent: SlackEvent {
    public var type: Swift.String?
    public var team: Swift.String?
    public var channel: Swift.String?
    public var user: Swift.String?
    public var text: Swift.String?
    public var blocks: [BlockType]?
    public var attachments: [Components.Schemas.Attachment]?
    public var metadata: Components.Schemas.MessageEventMetadata?
    public var ts: Swift.String?
    public var edited: Components.Schemas.Edited?
    public var clientMsgId: Swift.String?
    public var botId: Swift.String?
    public var botProfile: Components.Schemas.BotProfile?
    public var parentUserId: Swift.String?
    public var threadTs: Swift.String?
    public var eventTs: Swift.String?
    public var channelType: Swift.String?
}
#endif
