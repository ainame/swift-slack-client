#if Events
import Foundation

public struct IMCreatedEvent: SlackEvent {
    public var type: Swift.String?
    public var user: Swift.String?
    public var channel: Components.Schemas.Channel?
}
#endif
