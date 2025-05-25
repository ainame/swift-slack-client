#if Events
import Foundation

public struct CallRejectedEvent: SlackEvent {
    public var type: Swift.String?
    public var callId: Swift.String?
    public var userId: Swift.String?
    public var channelId: Swift.String?
    public var externalUniqueId: Swift.String?
}
#endif
