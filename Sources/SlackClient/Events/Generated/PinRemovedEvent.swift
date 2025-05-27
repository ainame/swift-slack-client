#if Events
import Foundation
import SlackModels

public struct PinRemovedEvent: SlackEvent {
    public var channelId: Swift.String?
    public var eventTs: Swift.String?
    public var hasPins: Swift.Bool?
    public var item: SlackModels.Item?
    public var itemUser: Swift.String?
    public var pinCount: Swift.Int?
    public var pinnedInfo: SlackModels.PinnedInfo?
    public var _type: Swift.String
    public var user: Swift.String?
    public enum CodingKeys: String, CodingKey {
        case channelId = "channel_id"
        case eventTs = "event_ts"
        case hasPins = "has_pins"
        case item
        case itemUser = "item_user"
        case pinCount = "pin_count"
        case pinnedInfo = "pinned_info"
        case _type = "type"
        case user
    }
}
#endif
