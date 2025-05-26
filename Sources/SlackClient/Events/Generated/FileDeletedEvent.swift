#if Events
import Foundation

public struct FileDeletedEvent: SlackEvent {
    public var channelIds: [Swift.String]?
    public var eventTs: Swift.String?
    public var fileId: Swift.String?
    public var type: Swift.String?
}
#endif
