#if Events
import Foundation

public struct PinAddedEvent: SlackEvent {
    public var type: Swift.String?
    public var user: Swift.String?
    public var item: Components.Schemas.Item?
    public var channelId: Swift.String?
    public var itemUser: Swift.String?
    public var pinCount: Swift.Int?
    public var pinnedInfo: Components.Schemas.PinnedInfo?
    public var eventTs: Swift.String?
}
#endif
