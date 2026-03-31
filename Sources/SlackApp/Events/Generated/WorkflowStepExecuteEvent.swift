#if Events
import Foundation
import SlackModels

public struct WorkflowStepExecuteEvent: SlackEvent {
    public var callbackId: Swift.String?
    public var eventTs: Swift.String?
    public var _type: Swift.String
    public var workflowStep: SlackModels.WorkflowStep?
    public enum CodingKeys: String, CodingKey {
        case callbackId = "callback_id"
        case eventTs = "event_ts"
        case _type = "type"
        case workflowStep = "workflow_step"
    }
}
#endif
