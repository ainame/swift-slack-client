#if Events
import Foundation

public struct MessageDeletedEvent: SlackEvent {
    public var type: Swift.String?
    public var subtype: Swift.String?
    public var channel: Swift.String?
    public var hidden: Swift.Bool?
    public var deletedTs: Swift.String?
    public var previousMessage: Components.Schemas.PreviousMessage?
    public var eventTs: Swift.String?
    public var ts: Swift.String?
    public var channelType: Swift.String?
}
#endif
