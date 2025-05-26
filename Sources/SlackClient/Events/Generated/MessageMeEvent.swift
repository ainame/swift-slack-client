#if Events
import Foundation

public struct MessageMeEvent: SlackEvent {
    public var type: Swift.String?
    public var subtype: Swift.String?
    public var channel: Swift.String?
    public var username: Swift.String?
    public var user: Swift.String?
    public var botId: Swift.String?
    public var text: Swift.String?
    public var eventTs: Swift.String?
    public var ts: Swift.String?
    public var channelType: Swift.String?
}
#endif
