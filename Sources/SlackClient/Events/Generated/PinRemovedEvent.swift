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
    public var type: Swift.String?
    public var user: Swift.String?
}
#endif
