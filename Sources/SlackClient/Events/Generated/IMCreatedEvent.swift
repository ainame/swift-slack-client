#if Events
import Foundation
import SlackModels

public struct IMCreatedEvent: SlackEvent {
    public var channel: SlackModels.Channel?
    public var _type: Swift.String
    public var user: Swift.String?
    public enum CodingKeys: String, CodingKey {
        case channel
        case _type = "type"
        case user
    }
}
#endif
