#if Events
import Foundation
import SlackModels

public struct SubteamCreatedEvent: SlackEvent {
    public var eventTs: Swift.String?
    public var subteam: SlackModels.Usergroup?
    public var type: Swift.String
}
#endif
