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
    /// - Remark: Generated from `#/components/schemas/CreationSource/reference_id`.
    public var referenceId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/CreationSource/type`.
    public var _type: Swift.String
    /// Creates a new `CreationSource`.
    ///
    /// - Parameters:
    ///   - referenceId:
    ///   - _type:
    public init(
        referenceId: Swift.String? = nil,
        _type: Swift.String
    ) {
        self.referenceId = referenceId
        self._type = _type
    }
    public enum CodingKeys: String, CodingKey {
        case referenceId = "reference_id"
        case _type = "type"
    }
}
