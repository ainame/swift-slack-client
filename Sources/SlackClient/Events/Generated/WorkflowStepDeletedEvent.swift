#if Events
import Foundation
import SlackModels

public struct WorkflowStepDeletedEvent: SlackEvent {
    public var eventTs: Swift.String?
    public var type: Swift.String
    public var workflowDraftConfiguration: SlackModels.WorkflowConfiguration?
    public var workflowId: Swift.String?
    public var workflowPublishedConfiguration: SlackModels.WorkflowConfiguration?
}
#endif
