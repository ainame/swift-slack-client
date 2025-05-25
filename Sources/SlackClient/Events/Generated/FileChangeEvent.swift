#if Events
import Foundation
import SlackModels

public struct FileChangeEvent: SlackEvent {
    public var type: Swift.String?
    public var file: SlackModels.File?
    public var fileId: Swift.String?
}
#endif
