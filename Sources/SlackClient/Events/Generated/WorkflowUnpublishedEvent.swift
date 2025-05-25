#if Events
import Foundation

public struct WorkflowUnpublishedEvent: SlackEvent {
    public var type: Swift.String?
    public var workflowId: Swift.String?
    public var workflowDraftConfiguration: Components.Schemas.WorkflowDraftConfiguration?
    public var eventTs: Swift.String?
}
#endif
