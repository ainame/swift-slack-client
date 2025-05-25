#if Events
import Foundation

public struct MemberLeftChannelEvent: SlackEvent {
    public var type: Swift.String?
    public var user: Swift.String?
    public var channel: Swift.String?
    public var team: Swift.String?
    public var channelType: Swift.String?
    public var eventTs: Swift.String?
}
#endif
