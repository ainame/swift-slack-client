#if Events
import Foundation
import SlackModels

public struct UserChangeEvent: SlackEvent {
    public var cacheTs: Swift.Int?
    public var type: Swift.String?
    public var user: SlackModels.User?
}
#endif
