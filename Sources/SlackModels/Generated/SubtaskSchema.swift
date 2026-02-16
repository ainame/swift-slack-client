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

/// - Remark: Generated from `#/components/schemas/SubtaskSchema`.
public struct SubtaskSchema: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/SubtaskSchema/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SubtaskSchema/is_primary_column`.
    public var isPrimaryColumn: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SubtaskSchema/key`.
    public var key: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SubtaskSchema/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SubtaskSchema/options`.
    public var options: SubtaskSchemaOptions?
    /// - Remark: Generated from `#/components/schemas/SubtaskSchema/type`.
    public var _type: Swift.String
    /// Creates a new `SubtaskSchema`.
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
        options: SubtaskSchemaOptions? = nil,
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
