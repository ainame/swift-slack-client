#if Events
import Foundation

public struct GroupLeftEvent: SlackEvent {
    public var type: Swift.String?
    public var channel: Swift.String?
    public var actorId: Swift.String?
    public var eventTs: Swift.String?
}
#endif
