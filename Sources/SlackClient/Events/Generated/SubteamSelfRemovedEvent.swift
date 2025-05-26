#if Events
import Foundation

public struct SubteamSelfRemovedEvent: SlackEvent {
    public var eventTs: Swift.String?
    public var subteamId: Swift.String?
    public var type: Swift.String
}
#endif
