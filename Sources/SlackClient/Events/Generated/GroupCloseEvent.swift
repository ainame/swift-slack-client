#if Events
import Foundation

public struct GroupCloseEvent: SlackEvent {
    public var type: Swift.String?
    public var user: Swift.String?
    public var channel: Swift.String?
}
#endif
