#if Events
import Foundation

public struct ScopeGrantedEvent: SlackEvent {
    public var type: Swift.String?
    public var scopes: [Swift.String]?
    public var triggerId: Swift.String?
}
#endif
