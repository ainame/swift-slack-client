#if Events
import Foundation
import SlackModels

public struct StarAddedEvent: SlackEvent {
    public var eventTs: Swift.String?
    public var item: SlackModels.Item?
    public var type: Swift.String?
    public var user: Swift.String?
}
#endif
