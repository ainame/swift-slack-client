#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#endif
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit

/// - Remark: Generated from `#/components/schemas/Schema`.
public struct Schema: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Schema/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Schema/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Schema/key`.
    public var key: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Schema/type`.
    public var type: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Schema/options`.
    public var options: SlackModels.Options?
    /// - Remark: Generated from `#/components/schemas/Schema/isPrimaryColumn`.
    public var isPrimaryColumn: Swift.Bool?
    /// Creates a new `Schema`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - name:
    ///   - key:
    ///   - type:
    ///   - options:
    ///   - isPrimaryColumn:
    public init(
        id: Swift.String? = nil,
        name: Swift.String? = nil,
        key: Swift.String? = nil,
        type: Swift.String? = nil,
        options: SlackModels.Options? = nil,
        isPrimaryColumn: Swift.Bool? = nil
    ) {
        self.id = id
        self.name = name
        self.key = key
        self.type = type
        self.options = options
        self.isPrimaryColumn = isPrimaryColumn
    }
}
