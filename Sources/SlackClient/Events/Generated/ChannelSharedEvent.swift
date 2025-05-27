#if Events
import Foundation

public struct ChannelSharedEvent: SlackEvent {
    public var channel: Swift.String?
    public var connectedTeamId: Swift.String?
    public var eventTs: Swift.String?
    public var _type: Swift.String
    public enum CodingKeys: String, CodingKey {
        case channel
        case connectedTeamId = "connected_team_id"
        case eventTs = "event_ts"
        case _type = "type"
    }
}
#endif
