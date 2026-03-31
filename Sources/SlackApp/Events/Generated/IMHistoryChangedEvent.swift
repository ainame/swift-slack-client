#if Events
import Foundation

public struct IMHistoryChangedEvent: SlackEvent {
    public var eventTs: Swift.String?
    public var latest: Swift.String?
    public var ts: Swift.String?
    public var _type: Swift.String
    public enum CodingKeys: String, CodingKey {
        case eventTs = "event_ts"
        case latest
        case ts
        case _type = "type"
    }
}
#endif
