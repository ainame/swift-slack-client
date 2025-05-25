#if Events
import Foundation

public struct ChannelUnsharedEvent: SlackEvent {
    public var type: Swift.String?
    public var channel: Swift.String?
    public var previouslyConnectedTeamId: Swift.String?
    public var isExtShared: Swift.Bool?
    public var eventTs: Swift.String?
}
#endif
