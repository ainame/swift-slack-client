import Foundation

public struct AppStep: Codable, Hashable, Sendable {
    public var appId: String?
    public var workflowStepId: String?
    public var callbackId: String?

    public init(
        appId: String? = nil,
        workflowStepId: String? = nil,
        callbackId: String? = nil
    ) {
        self.appId = appId
        self.workflowStepId = workflowStepId
        self.callbackId = callbackId
    }

    private enum CodingKeys: String, CodingKey {
        case appId = "app_id"
        case workflowStepId = "workflow_step_id"
        case callbackId = "callback_id"
    }
}
