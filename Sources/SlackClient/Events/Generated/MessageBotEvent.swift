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
    public var type: Swift.String
    public var username: Swift.String?
}
#endif
