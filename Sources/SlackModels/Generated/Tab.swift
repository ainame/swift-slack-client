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

/// - Remark: Generated from `#/components/schemas/Tab`.
public struct Tab: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Tab/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Tab/label`.
    public var label: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Tab/type`.
    public var _type: Swift.String
    /// Creates a new `Tab`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - label:
    ///   - _type:
    public init(
        id: Swift.String? = nil,
        label: Swift.String? = nil,
        _type: Swift.String
    ) {
        self.id = id
        self.label = label
        self._type = _type
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case label
        case _type = "type"
    }
}
