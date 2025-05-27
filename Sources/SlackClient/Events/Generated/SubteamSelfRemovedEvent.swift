#if Events
import Foundation

public struct SubteamSelfRemovedEvent: SlackEvent {
    public var eventTs: Swift.String?
    public var subteamId: Swift.String?
    public var _type: Swift.String
    public enum CodingKeys: String, CodingKey {
        case eventTs = "event_ts"
        case subteamId = "subteam_id"
        case _type = "type"
    }
}
#endif
