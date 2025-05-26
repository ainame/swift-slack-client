#if Events
import Foundation
import SlackModels

public struct ReactionAddedEvent: SlackEvent {
    public var eventTs: Swift.String?
    public var item: SlackModels.Item?
    public var itemUser: Swift.String?
    public var reaction: Swift.String?
    public var type: Swift.String
    public var user: Swift.String?
}
#endif
