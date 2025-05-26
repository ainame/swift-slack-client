#if Events
import Foundation
import SlackModels

public struct WorkflowPublishedEvent: SlackEvent {
    public var eventTs: Swift.String?
    public var type: Swift.String?
    public var workflowId: Swift.String?
    public var workflowPublishedConfiguration: SlackModels.WorkflowConfiguration?
}
#endif
