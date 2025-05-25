#if Events
import Foundation
import SlackModels

public struct WorkflowStepExecuteEvent: SlackEvent {
    public var type: Swift.String?
    public var callbackId: Swift.String?
    public var workflowStep: SlackModels.WorkflowStep?
    public var eventTs: Swift.String?
}
#endif
