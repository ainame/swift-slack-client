#if Events
import Foundation
import SlackModels

public struct WorkflowUnpublishedEvent: SlackEvent {
    public var type: Swift.String?
    public var workflowId: Swift.String?
    public var workflowDraftConfiguration: SlackModels.WorkflowConfiguration?
    public var eventTs: Swift.String?
}
#endif
