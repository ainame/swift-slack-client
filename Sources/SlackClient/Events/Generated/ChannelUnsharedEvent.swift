#if Events
import Foundation

public struct ChannelUnsharedEvent: SlackEvent {
    public var channel: Swift.String?
    public var eventTs: Swift.String?
    public var isExtShared: Swift.Bool?
    public var previouslyConnectedTeamId: Swift.String?
    public var type: Swift.String?
}
#endif
