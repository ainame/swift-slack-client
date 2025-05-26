@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
@preconcurrency import struct Foundation.URL
@preconcurrency import struct Foundation.Data
@preconcurrency import struct Foundation.Date
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/Function`.
public struct Function: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Function/description`.
    public var description: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Function/input_parameters`.
    public var inputParameters: OpenAPIRuntime.OpenAPIObjectContainer?
    /// - Remark: Generated from `#/components/schemas/Function/output_parameters`.
    public var outputParameters: OpenAPIRuntime.OpenAPIObjectContainer?
    /// - Remark: Generated from `#/components/schemas/Function/title`.
    public var title: Swift.String?
    /// Creates a new `Function`.
    ///
    /// - Parameters:
    ///   - description:
    ///   - inputParameters:
    ///   - outputParameters:
    ///   - title:
    public init(
        description: Swift.String? = nil,
        inputParameters: OpenAPIRuntime.OpenAPIObjectContainer? = nil,
        outputParameters: OpenAPIRuntime.OpenAPIObjectContainer? = nil,
        title: Swift.String? = nil
    ) {
        self.description = description
        self.inputParameters = inputParameters
        self.outputParameters = outputParameters
        self.title = title
    }
    public enum CodingKeys: String, CodingKey {
        case description
        case inputParameters = "input_parameters"
        case outputParameters = "output_parameters"
        case title
    }
}
