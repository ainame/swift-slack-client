#if Events
import Foundation
import SlackModels

public struct FileUnsharedEvent: SlackEvent {
    public var channelId: Swift.String?
    public var eventTs: Swift.String?
    public var file: SlackModels.File?
    public var fileId: Swift.String?
    public var _type: Swift.String
    public var userId: Swift.String?
    public enum CodingKeys: String, CodingKey {
        case channelId = "channel_id"
        case eventTs = "event_ts"
        case file
        case fileId = "file_id"
        case _type = "type"
        case userId = "user_id"
    }
}
#endif
