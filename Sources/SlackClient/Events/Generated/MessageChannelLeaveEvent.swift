#if Events
import Foundation

public struct MessageChannelLeaveEvent: SlackEvent {
    public var channel: Swift.String?
    public var channelType: Swift.String?
    public var eventTs: Swift.String?
    public var subtype: Swift.String?
    public var team: Swift.String?
    public var text: Swift.String?
    public var ts: Swift.String?
    public var type: Swift.String
    public var user: Swift.String?
}
#endif
