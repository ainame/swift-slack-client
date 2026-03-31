#if Events
import Foundation
import SlackModels

public struct PinAddedEvent: SlackEvent {
    public var channelId: Swift.String?
    public var eventTs: Swift.String?
    public var item: SlackModels.Item?
    public var itemUser: Swift.String?
    public var pinCount: Swift.Int?
    public var pinnedInfo: SlackModels.PinnedInfo?
    public var _type: Swift.String
    public var user: Swift.String?
    public enum CodingKeys: String, CodingKey {
        case channelId = "channel_id"
        case eventTs = "event_ts"
        case item
        case itemUser = "item_user"
        case pinCount = "pin_count"
        case pinnedInfo = "pinned_info"
        case _type = "type"
        case user
    }
}
#endif
