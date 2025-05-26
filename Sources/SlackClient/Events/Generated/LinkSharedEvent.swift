#if Events
import Foundation
import SlackModels

public struct LinkSharedEvent: SlackEvent {
    public var channel: Swift.String?
    public var eventTs: Swift.String?
    public var isBotUserMember: Swift.Bool?
    public var links: [SlackModels.Link]?
    public var messageTs: Swift.String?
    public var source: Swift.String?
    public var threadTs: Swift.String?
    public var type: Swift.String?
    public var unfurlId: Swift.String?
    public var user: Swift.String?
}
#endif
