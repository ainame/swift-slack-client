#if Events
import Foundation

public struct GroupDeletedEvent: SlackEvent {
    public var type: Swift.String?
    public var channel: Swift.String?
    public var dateDeleted: Swift.Int?
    public var actorId: Swift.String?
    public var eventTs: Swift.String?
}
#endif
