#if Events
import Foundation

public struct GroupOpenEvent: SlackEvent {
    public var channel: Swift.String?
    public var type: Swift.String
    public var user: Swift.String?
}
#endif
