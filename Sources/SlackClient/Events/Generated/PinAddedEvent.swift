#if Events
import Foundation
import SlackModels

public struct PinAddedEvent: SlackEvent {
    public var type: Swift.String?
    public var user: Swift.String?
    public var channelId: Swift.String?
    public var item: SlackModels.Item?
    public var itemUser: Swift.String?
    public var pinCount: Swift.Int?
    public var pinnedInfo: SlackModels.PinnedInfo?
    public var eventTs: Swift.String?
}
#endif
