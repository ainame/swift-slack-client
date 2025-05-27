#if Events
import Foundation
import SlackModels

public struct ReactionRemovedEvent: SlackEvent {
    public var eventTs: Swift.String?
    public var item: SlackModels.Item?
    public var itemUser: Swift.String?
    public var reaction: Swift.String?
    public var _type: Swift.String
    public var user: Swift.String?
    public enum CodingKeys: String, CodingKey {
        case eventTs = "event_ts"
        case item
        case itemUser = "item_user"
        case reaction
        case _type = "type"
        case user
    }
}
#endif
