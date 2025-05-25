#if Events
import Foundation

public struct MessageChannelJoinEvent: SlackEvent {
    public var type: Swift.String?
    public var subtype: Swift.String?
    public var team: Swift.String?
    public var user: Swift.String?
    public var inviter: Swift.String?
    public var channel: Swift.String?
    public var text: Swift.String?
    public var ts: Swift.String?
    public var channelType: Swift.String?
    public var eventTs: Swift.String?
}
#endif
