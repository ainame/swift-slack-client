#if Events
import Foundation
import SlackModels

public struct ReactionRemovedEvent: SlackEvent {
    public var type: Swift.String?
    public var user: Swift.String?
    public var item: SlackModels.Item?
    public var reaction: Swift.String?
    public var itemUser: Swift.String?
    public var eventTs: Swift.String?
}
#endif
