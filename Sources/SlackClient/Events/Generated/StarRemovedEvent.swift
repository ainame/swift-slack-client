#if Events
import Foundation
import SlackModels

public struct StarRemovedEvent: SlackEvent {
    public var eventTs: Swift.String?
    public var item: SlackModels.Item?
    public var _type: Swift.String
    public var user: Swift.String?
    public enum CodingKeys: String, CodingKey {
        case eventTs = "event_ts"
        case item
        case _type = "type"
        case user
    }
}
#endif
