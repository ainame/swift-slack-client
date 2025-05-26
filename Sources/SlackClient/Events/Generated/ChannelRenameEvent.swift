#if Events
import Foundation
import SlackModels

public struct ChannelRenameEvent: SlackEvent {
    public var channel: SlackModels.Channel?
    public var eventTs: Swift.String?
    public var type: Swift.String
}
#endif
