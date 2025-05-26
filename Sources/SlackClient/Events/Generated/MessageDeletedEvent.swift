#if Events
import Foundation
import SlackModels

public struct MessageDeletedEvent: SlackEvent {
    public var channel: Swift.String?
    public var channelType: Swift.String?
    public var deletedTs: Swift.String?
    public var eventTs: Swift.String?
    public var hidden: Swift.Bool?
    public var previousMessage: SlackModels.Message?
    public var subtype: Swift.String?
    public var ts: Swift.String?
    public var type: Swift.String
}
#endif
