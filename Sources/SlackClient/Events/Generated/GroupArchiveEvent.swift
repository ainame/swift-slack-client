#if Events
import Foundation

public struct GroupArchiveEvent: SlackEvent {
    public var type: Swift.String?
    public var channel: Swift.String?
    public var user: Swift.String?
    public var isMoved: Swift.Int?
    public var eventTs: Swift.String?
}
#endif
