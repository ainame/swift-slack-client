#if Events
import Foundation
import SlackModels

public struct FileChangeEvent: SlackEvent {
    public var file: SlackModels.File?
    public var fileId: Swift.String?
    public var _type: Swift.String
    public enum CodingKeys: String, CodingKey {
        case file
        case fileId = "file_id"
        case _type = "type"
    }
}
#endif
