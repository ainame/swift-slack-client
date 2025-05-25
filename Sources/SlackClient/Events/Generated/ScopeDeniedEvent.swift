#if Events
import Foundation

public struct ScopeDeniedEvent: SlackEvent {
    public var type: Swift.String?
    public var scopes: [Swift.String]?
    public var triggerId: Swift.String?
}
#endif
