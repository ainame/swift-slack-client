#if Events
import Foundation

public struct ChannelUnarchiveEvent: SlackEvent {
    public var channel: Swift.String?
    public var eventTs: Swift.String?
    public var type: Swift.String
    public var user: Swift.String?
}
#endif
