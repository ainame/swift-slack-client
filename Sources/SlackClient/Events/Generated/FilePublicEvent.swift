#if Events
import Foundation

public struct FilePublicEvent: SlackEvent {
    public var file: Components.Schemas.File?
    public var type: Swift.String?
    public var fileId: Swift.String?
    public var userId: Swift.String?
    public var eventTs: Swift.String?
}
#endif
