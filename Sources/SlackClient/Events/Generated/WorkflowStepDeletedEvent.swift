#if Events
import Foundation
import SlackModels

public struct WorkflowStepDeletedEvent: SlackEvent {
    public var type: Swift.String?
    public var workflowId: Swift.String?
    public var workflowDraftConfiguration: SlackModels.WorkflowConfiguration?
    public var workflowPublishedConfiguration: SlackModels.WorkflowConfiguration?
    public var eventTs: Swift.String?
}
#endif
