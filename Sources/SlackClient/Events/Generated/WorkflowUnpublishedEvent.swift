#if Events
import Foundation
import SlackModels

public struct WorkflowUnpublishedEvent: SlackEvent {
    public var eventTs: Swift.String?
    public var _type: Swift.String
    public var workflowDraftConfiguration: SlackModels.WorkflowConfiguration?
    public var workflowId: Swift.String?
    public enum CodingKeys: String, CodingKey {
        case eventTs = "event_ts"
        case _type = "type"
        case workflowDraftConfiguration = "workflow_draft_configuration"
        case workflowId = "workflow_id"
    }
}
#endif
