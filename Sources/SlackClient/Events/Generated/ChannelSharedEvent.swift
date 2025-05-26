#if Events
import Foundation

public struct ChannelSharedEvent: SlackEvent {
    public var channel: Swift.String?
    public var connectedTeamId: Swift.String?
    public var eventTs: Swift.String?
    public var type: Swift.String?
}
#endif
