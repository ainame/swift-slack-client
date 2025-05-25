#if Events
import Foundation

public struct MessageChangedEvent: SlackEvent {
    public var type: Swift.String?
    public var subtype: Swift.String?
    public var channel: Swift.String?
    public var hidden: Swift.Bool?
    public var message: Components.Schemas.Message?
    public var ts: Swift.String?
    public var previousMessage: Components.Schemas.Message?
    public var eventTs: Swift.String?
    public var channelType: Swift.String?
}
#endif
