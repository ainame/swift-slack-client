#if Events
import Foundation

public struct FileDeletedEvent: SlackEvent {
    public var channelIds: [Swift.String]?
    public var eventTs: Swift.String?
    public var fileId: Swift.String?
    public var _type: Swift.String
    public enum CodingKeys: String, CodingKey {
        case channelIds = "channel_ids"
        case eventTs = "event_ts"
        case fileId = "file_id"
        case _type = "type"
    }
}
#endif
