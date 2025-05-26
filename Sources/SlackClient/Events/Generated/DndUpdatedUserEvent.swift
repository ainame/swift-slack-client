#if Events
import Foundation
import SlackModels

public struct DndUpdatedUserEvent: SlackEvent {
    public var dndStatus: SlackModels.DndStatus?
    public var eventTs: Swift.String?
    public var type: Swift.String?
    public var user: Swift.String?
}
#endif
