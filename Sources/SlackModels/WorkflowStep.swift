import Foundation
import OpenAPIRuntime

public struct WorkflowStep: Codable, Hashable, Sendable {
    public var workflowStepExecuteId: Swift.String?
    public var workflowId: Swift.String?
    public var workflowInstanceId: Swift.String?
    public var stepId: Swift.String?
    /// [String: WorkflowStepInput]
    public var inputs: OpenAPIObjectContainer?
    public var outputs: [WorkflowStepOutput]?

    public init(
        workflowStepExecuteId: String? = nil,
        workflowId: String? = nil,
        workflowInstanceId: String? = nil,
        stepId: String? = nil,
        inputs: OpenAPIObjectContainer? = nil,
        outputs: [WorkflowStepOutput]? = nil,
    ) {
        self.workflowStepExecuteId = workflowStepExecuteId
        self.workflowId = workflowId
        self.workflowInstanceId = workflowInstanceId
        self.stepId = stepId
        self.inputs = inputs
        self.outputs = outputs
    }

    private enum CodingKeys: String, CodingKey {
        case workflowStepExecuteId = "workflow_step_execute_id"
        case workflowId = "workflow_id"
        case workflowInstanceId = "workflow_instance_id"
        case stepId = "step_id"
        case inputs
        case outputs
    }
}
