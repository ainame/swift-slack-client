#if Events
import Foundation

public struct UserResourceRemovedEvent: SlackEvent {
    public var type: Swift.String?
    public var user: Swift.String?
    public var triggerId: Swift.String?
}
#endif
