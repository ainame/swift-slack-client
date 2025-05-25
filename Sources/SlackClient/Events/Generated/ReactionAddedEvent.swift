#if Events
import Foundation

public struct ReactionAddedEvent: SlackEvent {
    public var type: Swift.String?
    public var user: Swift.String?
    public var item: Components.Schemas.Item?
    public var reaction: Swift.String?
    public var itemUser: Swift.String?
    public var eventTs: Swift.String?
}
#endif
