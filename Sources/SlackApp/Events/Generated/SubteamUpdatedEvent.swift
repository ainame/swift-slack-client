#if Events
import Foundation
import SlackModels

public struct SubteamUpdatedEvent: SlackEvent {
    public var eventTs: Swift.String?
    public var subteam: SlackModels.Usergroup?
    public var _type: Swift.String
    public enum CodingKeys: String, CodingKey {
        case eventTs = "event_ts"
        case subteam
        case _type = "type"
    }
}
#endif
