#if Events
import Foundation

public struct InviteRequestedEvent: SlackEvent {
    public var type: Swift.String?
    public var inviteRequest: Components.Schemas.InviteRequest?
}
#endif
