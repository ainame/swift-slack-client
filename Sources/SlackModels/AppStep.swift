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
}
