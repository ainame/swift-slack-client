#if Events
import Foundation
import SlackModels

public struct TeamJoinEvent: SlackEvent {
    public var type: Swift.String?
    public var user: SlackModels.User?
}
#endif
