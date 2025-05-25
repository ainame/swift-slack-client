@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/Function`.
public struct Function: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Function/title`.
    public var title: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Function/description`.
    public var description: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Function/inputParameters`.
    public var inputParameters: OpenAPIRuntime.OpenAPIObjectContainer?
    /// - Remark: Generated from `#/components/schemas/Function/outputParameters`.
    public var outputParameters: OpenAPIRuntime.OpenAPIObjectContainer?
    /// Creates a new `Function`.
    ///
    /// - Parameters:
    ///   - title:
    ///   - description:
    ///   - inputParameters:
    ///   - outputParameters:
    public init(
        title: Swift.String? = nil,
        description: Swift.String? = nil,
        inputParameters: OpenAPIRuntime.OpenAPIObjectContainer? = nil,
        outputParameters: OpenAPIRuntime.OpenAPIObjectContainer? = nil
    ) {
        self.title = title
        self.description = description
        self.inputParameters = inputParameters
        self.outputParameters = outputParameters
    }
}
