#if Events
import Foundation
import SlackModels

public struct WorkflowStepDeletedEvent: SlackEvent {
    public var eventTs: Swift.String?
    public var _type: Swift.String
    public var workflowDraftConfiguration: SlackModels.WorkflowConfiguration?
    public var workflowId: Swift.String?
    public var workflowPublishedConfiguration: SlackModels.WorkflowConfiguration?
    public enum CodingKeys: String, CodingKey {
        case eventTs = "event_ts"
        case _type = "type"
        case workflowDraftConfiguration = "workflow_draft_configuration"
        case workflowId = "workflow_id"
        case workflowPublishedConfiguration = "workflow_published_configuration"
    }
}
#endif
