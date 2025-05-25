#if Events
import Foundation

public struct UserResourceGrantedEvent: SlackEvent {
    public var type: Swift.String?
    public var user: Swift.String?
    public var scopes: [Swift.String]?
    public var triggerId: Swift.String?
}
#endif
