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
    public var type: Swift.String
    public var user: Swift.String?
}
#endif
