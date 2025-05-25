#if Events
import Foundation
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

public struct MessageThreadBroadcastEvent: SlackEvent {
    public var type: Swift.String?
    public var subtype: Swift.String?
    public var channel: Swift.String?
    public var user: Swift.String?
    public var root: Components.Schemas.Root?
    public var text: Swift.String?
    public var blocks: [BlockType]?
    public var attachments: [Components.Schemas.Attachment]?
    public var ts: Swift.String?
    public var clientMsgId: Swift.String?
    public var threadTs: Swift.String?
    public var eventTs: Swift.String?
    public var channelType: Swift.String?
}
#endif
