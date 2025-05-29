@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
@preconcurrency import struct Foundation.Data
@preconcurrency import struct Foundation.Date
@preconcurrency import struct Foundation.URL
#else
import struct Foundation.Data
import struct Foundation.Date
import struct Foundation.URL
#endif

/// - Remark: Generated from `#/components/schemas/CreationSource`.
public struct CreationSource: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/CreationSource/reference_id`.
    public var referenceId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/CreationSource/type`.
    public var _type: Swift.String
    /// - Remark: Generated from `#/components/schemas/CreationSource/workflow_function_id`.
    public var workflowFunctionId: Swift.String?
    /// Creates a new `CreationSource`.
    ///
    /// - Parameters:
    ///   - referenceId:
    ///   - _type:
    ///   - workflowFunctionId:
    public init(
        referenceId: Swift.String? = nil,
        _type: Swift.String,
        workflowFunctionId: Swift.String? = nil
    ) {
        self.referenceId = referenceId
        self._type = _type
        self.workflowFunctionId = workflowFunctionId
    }

    public enum CodingKeys: String, CodingKey {
        case referenceId = "reference_id"
        case _type = "type"
        case workflowFunctionId = "workflow_function_id"
    }
}
