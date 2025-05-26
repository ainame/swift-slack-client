#if Events
import Foundation

public struct ChannelSharedEvent: SlackEvent {
    public var type: Swift.String?
    public var connectedTeamId: Swift.String?
    public var channel: Swift.String?
    public var eventTs: Swift.String?
}
#endif
