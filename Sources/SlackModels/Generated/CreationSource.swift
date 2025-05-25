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

/// - Remark: Generated from `#/components/schemas/CreationSource`.
public struct CreationSource: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/CreationSource/type`.
    public var type: Swift.String?
    /// - Remark: Generated from `#/components/schemas/CreationSource/referenceId`.
    public var referenceId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/CreationSource/workflowFunctionId`.
    public var workflowFunctionId: Swift.String?
    /// Creates a new `CreationSource`.
    ///
    /// - Parameters:
    ///   - type:
    ///   - referenceId:
    ///   - workflowFunctionId:
    public init(
        type: Swift.String? = nil,
        referenceId: Swift.String? = nil,
        workflowFunctionId: Swift.String? = nil
    ) {
        self.type = type
        self.referenceId = referenceId
        self.workflowFunctionId = workflowFunctionId
    }
}
