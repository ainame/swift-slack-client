#if Events
import Foundation

public struct StarRemovedEvent: SlackEvent {
    public var type: Swift.String?
    public var user: Swift.String?
    public var item: Components.Schemas.Item?
    public var eventTs: Swift.String?
}
#endif
