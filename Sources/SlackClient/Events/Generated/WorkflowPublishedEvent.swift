#if Events
import Foundation

public struct WorkflowPublishedEvent: SlackEvent {
    public var type: Swift.String?
    public var workflowId: Swift.String?
    public var workflowPublishedConfiguration: Components.Schemas.WorkflowPublishedConfiguration?
    public var eventTs: Swift.String?
}
#endif
