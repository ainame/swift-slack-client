#if Events
import Foundation
import SlackModels

public struct WorkflowStepExecuteEvent: SlackEvent {
    public var callbackId: Swift.String?
    public var eventTs: Swift.String?
    public var type: Swift.String?
    public var workflowStep: SlackModels.WorkflowStep?
}
#endif
