#if Events
import Foundation

public struct CallRejectedEvent: SlackEvent {
    public var callId: Swift.String?
    public var channelId: Swift.String?
    public var externalUniqueId: Swift.String?
    public var type: Swift.String?
    public var userId: Swift.String?
}
#endif
