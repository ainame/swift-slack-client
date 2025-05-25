#if Events
import Foundation

public struct WorkflowStepDeletedEvent: SlackEvent {
    public var type: Swift.String?
    public var workflowId: Swift.String?
    public var workflowDraftConfiguration: Components.Schemas.WorkflowConfiguration?
    public var workflowPublishedConfiguration: Components.Schemas.WorkflowConfiguration?
    public var eventTs: Swift.String?
}
#endif
