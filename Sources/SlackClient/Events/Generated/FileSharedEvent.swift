#if Events
import Foundation
import SlackModels

public struct FileSharedEvent: SlackEvent {
    public var channelId: Swift.String?
    public var eventTs: Swift.String?
    public var file: SlackModels.File?
    public var fileId: Swift.String?
    public var type: Swift.String?
    public var userId: Swift.String?
}
#endif
