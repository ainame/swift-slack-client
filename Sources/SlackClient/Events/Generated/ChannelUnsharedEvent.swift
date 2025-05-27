#if Events
import Foundation

public struct ChannelUnsharedEvent: SlackEvent {
    public var channel: Swift.String?
    public var eventTs: Swift.String?
    public var isExtShared: Swift.Bool?
    public var previouslyConnectedTeamId: Swift.String?
    public var _type: Swift.String
    public enum CodingKeys: String, CodingKey {
        case channel
        case eventTs = "event_ts"
        case isExtShared = "is_ext_shared"
        case previouslyConnectedTeamId = "previously_connected_team_id"
        case _type = "type"
    }
}
#endif
