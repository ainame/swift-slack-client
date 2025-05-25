import Foundation
import OpenAPIRuntime

public struct WorkflowStepOutput: Codable, Hashable, Sendable {
    public var name: Swift.String?
    public var type: Swift.String?
    public var label: Swift.String?

    public init(name: String? = nil, type: String? = nil, label: String? = nil) {
        self.name = name
        self.type = type
        self.label = label
    }
}
