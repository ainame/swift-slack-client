#if Events
import Foundation

public struct IMHistoryChangedEvent: SlackEvent {
    public var eventTs: Swift.String?
    public var latest: Swift.String?
    public var ts: Swift.String?
    public var type: Swift.String?
}
#endif
