#if Events
import Foundation

public struct EmojiChangedEvent: SlackEvent {
    public var subtype: Swift.String?
    public var name: Swift.String?
    public var value: Swift.String?
    public var type: Swift.String?
    public var eventTs: Swift.String?
    public var oldName: Swift.String?
    public var newName: Swift.String?
}
#endif
