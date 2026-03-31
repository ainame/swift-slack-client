#if Events
import Foundation

public struct TeamAccessRevokedEvent: SlackEvent {
    public var eventTs: Swift.String?
    public var teamIds: [Swift.String]?
    public var _type: Swift.String
    public enum CodingKeys: String, CodingKey {
        case eventTs = "event_ts"
        case teamIds = "team_ids"
        case _type = "type"
    }
}
#endif
