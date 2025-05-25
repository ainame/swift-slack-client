#if Events
import Foundation
import SlackModels

public struct IMCreatedEvent: SlackEvent {
    public var type: Swift.String?
    public var user: Swift.String?
    public var channel: SlackModels.Channel?
}
#endif
