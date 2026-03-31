#if Events
import Foundation

public struct EmojiChangedEvent: SlackEvent {
    public var eventTs: Swift.String?
    public var name: Swift.String?
    public var newName: Swift.String?
    public var oldName: Swift.String?
    public var subtype: Swift.String?
    public var _type: Swift.String
    public var value: Swift.String?
    public enum CodingKeys: String, CodingKey {
        case eventTs = "event_ts"
        case name
        case newName = "new_name"
        case oldName = "old_name"
        case subtype
        case _type = "type"
        case value
    }
}
#endif
