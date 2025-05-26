#if Events
import Foundation

public struct ScopeDeniedEvent: SlackEvent {
    public var scopes: [Swift.String]?
    public var triggerId: Swift.String?
    public var type: Swift.String?
}
#endif
