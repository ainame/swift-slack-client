#if Events
import Foundation
import SlackModels

public struct WorkflowPublishedEvent: SlackEvent {
    public var eventTs: Swift.String?
    public var _type: Swift.String
    public var workflowId: Swift.String?
    public var workflowPublishedConfiguration: SlackModels.WorkflowConfiguration?
    public enum CodingKeys: String, CodingKey {
        case eventTs = "event_ts"
        case _type = "type"
        case workflowId = "workflow_id"
        case workflowPublishedConfiguration = "workflow_published_configuration"
    }
}
#endif
