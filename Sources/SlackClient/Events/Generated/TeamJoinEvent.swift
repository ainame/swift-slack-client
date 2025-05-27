#if Events
import Foundation
import SlackModels

public struct TeamJoinEvent: SlackEvent {
    public var _type: Swift.String
    public var user: SlackModels.User?
    public enum CodingKeys: String, CodingKey {
        case _type = "type"
        case user
    }
}
#endif
