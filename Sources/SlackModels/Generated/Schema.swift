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

/// - Remark: Generated from `#/components/schemas/Schema`.
public struct Schema: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Schema/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Schema/is_primary_column`.
    public var isPrimaryColumn: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Schema/key`.
    public var key: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Schema/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Schema/options`.
    public var options: Options?
    /// - Remark: Generated from `#/components/schemas/Schema/type`.
    public var _type: Swift.String
    /// Creates a new `Schema`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - isPrimaryColumn:
    ///   - key:
    ///   - name:
    ///   - options:
    ///   - _type:
    public init(
        id: Swift.String? = nil,
        isPrimaryColumn: Swift.Bool? = nil,
        key: Swift.String? = nil,
        name: Swift.String? = nil,
        options: Options? = nil,
        _type: Swift.String
    ) {
        self.id = id
        self.isPrimaryColumn = isPrimaryColumn
        self.key = key
        self.name = name
        self.options = options
        self._type = _type
    }
    public enum CodingKeys: String, CodingKey {
        case id
        case isPrimaryColumn = "is_primary_column"
        case key
        case name
        case options
        case _type = "type"
    }
}
