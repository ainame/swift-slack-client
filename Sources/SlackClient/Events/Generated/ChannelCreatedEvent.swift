#if Events
import Foundation
import SlackModels

public struct ChannelCreatedEvent: SlackEvent {
    public var channel: SlackModels.Channel?
    public var eventTs: Swift.String?
    public var type: Swift.String
}
#endif
