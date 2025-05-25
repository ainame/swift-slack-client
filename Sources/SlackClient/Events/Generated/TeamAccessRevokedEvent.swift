#if Events
import Foundation

public struct TeamAccessRevokedEvent: SlackEvent {
    public var type: Swift.String?
    public var teamIds: [Swift.String]?
    public var eventTs: Swift.String?
}
#endif
