#if Events
import Foundation

public struct LinkSharedEvent: SlackEvent {
    public var type: Swift.String?
    public var channel: Swift.String?
    public var user: Swift.String?
    public var links: [Components.Schemas.Link]?
    public var source: Swift.String?
    public var messageTs: Swift.String?
    public var threadTs: Swift.String?
    public var isBotUserMember: Swift.Bool?
    public var unfurlId: Swift.String?
    public var eventTs: Swift.String?
}
#endif
