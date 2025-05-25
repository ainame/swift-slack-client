#if Events
import Foundation

public struct ChannelIDChangedEvent: SlackEvent {
    public var type: Swift.String?
    public var oldChannelId: Swift.String?
    public var newChannelId: Swift.String?
    public var eventTs: Swift.String?
}
#endif
