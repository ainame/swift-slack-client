#if Events
import Foundation
import SlackModels

public struct InviteRequestedEvent: SlackEvent {
    public var inviteRequest: SlackModels.InviteRequest?
    public var _type: Swift.String
    public enum CodingKeys: String, CodingKey {
        case inviteRequest = "invite_request"
        case _type = "type"
    }
}
#endif
