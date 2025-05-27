#if Events
import Foundation
import SlackModels

public struct MessageRepliedEvent: SlackEvent {
    public var channel: Swift.String?
    public var eventTs: Swift.String?
    public var hidden: Swift.Bool?
    public var message: SlackModels.Message?
    public var subtype: Swift.String?
    public var ts: Swift.String?
    public var _type: Swift.String
    public enum CodingKeys: String, CodingKey {
        case channel
        case eventTs = "event_ts"
        case hidden
        case message
        case subtype
        case ts
        case _type = "type"
    }
}
#endif
