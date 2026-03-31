#if Events
import Foundation
import SlackModels

public struct DndUpdatedEvent: SlackEvent {
    public var dndStatus: SlackModels.DndStatus?
    public var eventTs: Swift.String?
    public var _type: Swift.String
    public var user: Swift.String?
    public enum CodingKeys: String, CodingKey {
        case dndStatus = "dnd_status"
        case eventTs = "event_ts"
        case _type = "type"
        case user
    }
}
#endif
