#if Events
import Foundation

public struct DndUpdatedUserEvent: SlackEvent {
    public var type: Swift.String?
    public var user: Swift.String?
    public var dndStatus: Components.Schemas.DndStatus?
    public var eventTs: Swift.String?
}
#endif
