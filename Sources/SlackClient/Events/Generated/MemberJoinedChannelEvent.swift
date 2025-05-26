#if Events
import Foundation

public struct MemberJoinedChannelEvent: SlackEvent {
    public var type: Swift.String?
    public var user: Swift.String?
    public var channel: Swift.String?
    public var channelType: Swift.String?
    public var team: Swift.String?
    public var eventTs: Swift.String?
    public var inviter: Swift.String?
    public var enterprise: Swift.String?
}
#endif
