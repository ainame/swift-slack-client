#if Events
import Foundation
import SlackModels

public struct SubteamUpdatedEvent: SlackEvent {
    public var type: Swift.String?
    public var subteam: SlackModels.Usergroup?
    public var eventTs: Swift.String?
}
#endif
