#if Events
import Foundation

public struct SubteamSelfRemovedEvent: SlackEvent {
    public var type: Swift.String?
    public var subteamId: Swift.String?
    public var eventTs: Swift.String?
}
#endif
