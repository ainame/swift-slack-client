#if Events
import Foundation

public struct ChannelCreatedEvent: SlackEvent {
    public var type: Swift.String?
    public var channel: Components.Schemas.Channel?
    public var eventTs: Swift.String?
}
#endif
