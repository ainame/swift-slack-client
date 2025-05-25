#if Events
import Foundation

public struct ResourcesAddedEvent: SlackEvent {
    public var type: Swift.String?
    public var resources: [Components.Schemas.ResourceElement]?
}
#endif
