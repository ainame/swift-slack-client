#if Events
import Foundation

public struct ChannelLeftEvent: SlackEvent {
    public var actorId: Swift.String?
    public var channel: Swift.String?
    public var eventTs: Swift.String?
    public var type: Swift.String?
}
#endif
