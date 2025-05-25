#if Events
import Foundation

public struct TeamJoinEvent: SlackEvent {
    public var type: Swift.String?
    public var user: Components.Schemas.User?
}
#endif
