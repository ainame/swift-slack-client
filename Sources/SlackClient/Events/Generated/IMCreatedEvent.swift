#if Events
import Foundation
import SlackModels

public struct IMCreatedEvent: SlackEvent {
    public var channel: SlackModels.Channel?
    public var type: Swift.String
    public var user: Swift.String?
}
#endif
