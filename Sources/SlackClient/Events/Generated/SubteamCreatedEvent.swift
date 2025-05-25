#if Events
import Foundation

public struct SubteamCreatedEvent: SlackEvent {
    public var type: Swift.String?
    public var subteam: Components.Schemas.Subteam?
    public var eventTs: Swift.String?
}
#endif
