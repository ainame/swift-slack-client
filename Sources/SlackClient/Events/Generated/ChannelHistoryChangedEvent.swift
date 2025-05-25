#if Events
import Foundation

public struct ChannelHistoryChangedEvent: SlackEvent {
    public var type: Swift.String?
    public var latest: Swift.String?
    public var ts: Swift.String?
    public var eventTs: Swift.String?
}
#endif
