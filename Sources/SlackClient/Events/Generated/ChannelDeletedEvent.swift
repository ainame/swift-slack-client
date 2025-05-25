#if Events
import Foundation

public struct ChannelDeletedEvent: SlackEvent {
    public var type: Swift.String?
    public var channel: Swift.String?
    public var actorId: Swift.String?
    public var eventTs: Swift.String?
}
#endif
