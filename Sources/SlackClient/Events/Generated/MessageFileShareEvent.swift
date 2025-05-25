#if Events
import Foundation
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

public struct MessageFileShareEvent: SlackEvent {
    public var type: Swift.String?
    public var subtype: Swift.String?
    public var text: Swift.String?
    public var blocks: [BlockType]?
    public var attachments: [Components.Schemas.Attachment]?
    public var files: [Components.Schemas.File]?
    public var upload: Swift.Bool?
    public var user: Swift.String?
    public var ts: Swift.String?
    public var channel: Swift.String?
    public var displayAsBot: Swift.Bool?
    public var parentUserId: Swift.String?
    public var threadTs: Swift.String?
    public var eventTs: Swift.String?
    public var channelType: Swift.String?
}
#endif
