#if Events
import Foundation

public struct GroupDeletedEvent: SlackEvent {
    public var actorId: Swift.String?
    public var channel: Swift.String?
    public var dateDeleted: Swift.Int?
    public var eventTs: Swift.String?
    public var _type: Swift.String
    public enum CodingKeys: String, CodingKey {
        case actorId = "actor_id"
        case channel
        case dateDeleted = "date_deleted"
        case eventTs = "event_ts"
        case _type = "type"
    }
}
#endif
