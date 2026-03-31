#if Events
import Foundation

public struct GroupCloseEvent: SlackEvent {
    public var channel: Swift.String?
    public var _type: Swift.String
    public var user: Swift.String?
    public enum CodingKeys: String, CodingKey {
        case channel
        case _type = "type"
        case user
    }
}
#endif
