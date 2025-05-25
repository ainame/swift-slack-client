#if Events
import Foundation
import SlackModels

public struct UserChangeEvent: SlackEvent {
    public var type: Swift.String?
    public var user: SlackModels.User?
    public var cacheTs: Swift.Int?
}
#endif
