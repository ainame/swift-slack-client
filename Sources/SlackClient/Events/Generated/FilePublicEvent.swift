#if Events
import Foundation
import SlackModels

public struct FilePublicEvent: SlackEvent {
    public var fileId: Swift.String?
    public var userId: Swift.String?
    public var file: SlackModels.File?
    public var type: Swift.String?
    public var eventTs: Swift.String?
}
#endif
