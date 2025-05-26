#if Events
import Foundation
import SlackModels

public struct LinkSharedEvent: SlackEvent {
    public var type: Swift.String?
    public var channel: Swift.String?
    public var user: Swift.String?
    public var messageTs: Swift.String?
    public var threadTs: Swift.String?
    public var links: [SlackModels.Link]?
    public var isBotUserMember: Swift.Bool?
    public var unfurlId: Swift.String?
    public var source: Swift.String?
    public var eventTs: Swift.String?
}
#endif
