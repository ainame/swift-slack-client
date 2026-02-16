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

/// - Remark: Generated from `#/components/schemas/Tab`.
public struct Tab: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Tab/data`.
    public var data: Data?
    /// - Remark: Generated from `#/components/schemas/Tab/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Tab/is_disabled`.
    public var isDisabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Tab/label`.
    public var label: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Tab/type`.
    public var _type: Swift.String
    /// Creates a new `Tab`.
    ///
    /// - Parameters:
    ///   - data:
    ///   - id:
    ///   - isDisabled:
    ///   - label:
    ///   - _type:
    public init(
        data: Data? = nil,
        id: Swift.String? = nil,
        isDisabled: Swift.Bool? = nil,
        label: Swift.String? = nil,
        _type: Swift.String
    ) {
        self.data = data
        self.id = id
        self.isDisabled = isDisabled
        self.label = label
        self._type = _type
    }
    public enum CodingKeys: String, CodingKey {
        case data
        case id
        case isDisabled = "is_disabled"
        case label
        case _type = "type"
    }
}
