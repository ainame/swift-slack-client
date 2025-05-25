#if Events
import Foundation
import SlackModels

public struct InviteRequestedEvent: SlackEvent {
    public var type: Swift.String?
    public var inviteRequest: SlackModels.InviteRequest?
}
#endif
