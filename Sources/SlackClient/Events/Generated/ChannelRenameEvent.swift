#if Events
import Foundation
import SlackModels

public struct ChannelRenameEvent: SlackEvent {
    public var type: Swift.String?
    public var channel: SlackModels.Channel?
    public var eventTs: Swift.String?
}
#endif
