#if Events
import Foundation
import SlackModels

public struct DndUpdatedUserEvent: SlackEvent {
    public var type: Swift.String?
    public var user: Swift.String?
    public var dndStatus: SlackModels.DndStatus?
    public var eventTs: Swift.String?
}
#endif
