import Foundation
import OpenAPIRuntime

public struct WorkflowStepInput: Codable, Hashable, Sendable {
    public var value: OpenAPIObjectContainer?
    public var skipVariableReplacement: Bool?
    public var variables: OpenAPIObjectContainer?

    public init(value: OpenAPIObjectContainer? = nil, skipVariableReplacement: Bool? = nil, variables: OpenAPIObjectContainer? = nil) {
        self.value = value
        self.skipVariableReplacement = skipVariableReplacement
        self.variables = variables
    }
}
