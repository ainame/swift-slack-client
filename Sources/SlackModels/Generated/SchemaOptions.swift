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

/// - Remark: Generated from `#/components/schemas/SchemaOptions`.
public struct SchemaOptions: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/SchemaOptions/choices`.
    public var choices: [Choice]?
    /// - Remark: Generated from `#/components/schemas/SchemaOptions/format`.
    public var format: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SchemaOptions/show_member_name`.
    public var showMemberName: Swift.Bool?
    /// Creates a new `SchemaOptions`.
    ///
    /// - Parameters:
    ///   - choices:
    ///   - format:
    ///   - showMemberName:
    public init(
        choices: [Choice]? = nil,
        format: Swift.String? = nil,
        showMemberName: Swift.Bool? = nil
    ) {
        self.choices = choices
        self.format = format
        self.showMemberName = showMemberName
    }
    public enum CodingKeys: String, CodingKey {
        case choices
        case format
        case showMemberName = "show_member_name"
    }
}
