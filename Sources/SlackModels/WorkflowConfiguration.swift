import Foundation

public struct WorkflowConfiguration: Codable, Hashable, Sendable {
    public var versionId: Swift.String?
    public var appSteps: [AppStep]?

    public init(versionId: String? = nil, appSteps: [AppStep]? = nil) {
        self.versionId = versionId
        self.appSteps = appSteps
    }
    
    private enum CodingKeys: String, CodingKey {
        case versionId = "version_id"
        case appSteps = "app_steps"
    }
}
