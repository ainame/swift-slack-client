#if Events
import Foundation
import SlackModels

public struct WorkflowUnpublishedEvent: SlackEvent {
    public var eventTs: Swift.String?
    public var type: Swift.String
    public var workflowDraftConfiguration: SlackModels.WorkflowConfiguration?
    public var workflowId: Swift.String?
}
#endif
