#if Events
import Foundation

public struct CallRejectedEvent: SlackEvent {
    public var callId: Swift.String?
    public var channelId: Swift.String?
    public var externalUniqueId: Swift.String?
    public var _type: Swift.String
    public var userId: Swift.String?
    public enum CodingKeys: String, CodingKey {
        case callId = "call_id"
        case channelId = "channel_id"
        case externalUniqueId = "external_unique_id"
        case _type = "type"
        case userId = "user_id"
    }
}
#endif
