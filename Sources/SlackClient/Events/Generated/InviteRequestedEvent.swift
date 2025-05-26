#if Events
import Foundation
import SlackModels

public struct InviteRequestedEvent: SlackEvent {
    public var inviteRequest: SlackModels.InviteRequest?
    public var type: Swift.String?
}
#endif
