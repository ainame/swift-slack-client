#if Events
import Foundation

public struct MessageRepliedEvent: SlackEvent {
    public var type: Swift.String?
    public var subtype: Swift.String?
    public var channel: Swift.String?
    public var hidden: Swift.Bool?
    public var message: Components.Schemas.Message?
    public var ts: Swift.String?
    public var eventTs: Swift.String?
}
#endif
