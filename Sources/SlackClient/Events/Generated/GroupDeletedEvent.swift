#if Events
import Foundation

public struct GroupDeletedEvent: SlackEvent {
    public var actorId: Swift.String?
    public var channel: Swift.String?
    public var dateDeleted: Swift.Int?
    public var eventTs: Swift.String?
    public var type: Swift.String
}
#endif
