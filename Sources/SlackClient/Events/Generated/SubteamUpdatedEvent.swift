#if Events
import Foundation
import SlackModels

public struct SubteamUpdatedEvent: SlackEvent {
    public var eventTs: Swift.String?
    public var subteam: SlackModels.Usergroup?
    public var type: Swift.String?
}
#endif
