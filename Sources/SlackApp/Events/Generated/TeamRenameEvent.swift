#if Events
import Foundation

public struct TeamRenameEvent: SlackEvent {
    public var name: Swift.String?
    public var _type: Swift.String
    public enum CodingKeys: String, CodingKey {
        case name
        case _type = "type"
    }
}
#endif
