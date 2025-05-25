#if Events
import Foundation

public struct WorkflowStepExecuteEvent: SlackEvent {
    public var type: Swift.String?
    public var callbackId: Swift.String?
    public var workflowStep: Components.Schemas.WorkflowStep?
    public var eventTs: Swift.String?
}
#endif
