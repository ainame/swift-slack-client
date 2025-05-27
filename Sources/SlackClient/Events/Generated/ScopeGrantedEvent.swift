#if Events
import Foundation

public struct ScopeGrantedEvent: SlackEvent {
    public var scopes: [Swift.String]?
    public var triggerId: Swift.String?
    public var _type: Swift.String
    public enum CodingKeys: String, CodingKey {
        case scopes
        case triggerId = "trigger_id"
        case _type = "type"
    }
}
#endif
