#if Events
import Foundation
import SlackModels

public struct MessageChangedEvent: SlackEvent {
    public var channel: Swift.String?
    public var channelType: Swift.String?
    public var eventTs: Swift.String?
    public var hidden: Swift.Bool?
    public var message: SlackModels.Message?
    public var previousMessage: SlackModels.Message?
    public var subtype: Swift.String?
    public var ts: Swift.String?
    public var type: Swift.String?
}
#endif
