#if Events
import Foundation

public struct FileChangeEvent: SlackEvent {
    public var type: Swift.String?
    public var file: Components.Schemas.File?
    public var fileId: Swift.String?
}
#endif
