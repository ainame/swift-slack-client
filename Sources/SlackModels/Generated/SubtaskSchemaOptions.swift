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

/// - Remark: Generated from `#/components/schemas/SubtaskSchemaOptions`.
public struct SubtaskSchemaOptions: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/SubtaskSchemaOptions/format`.
    public var format: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SubtaskSchemaOptions/show_member_name`.
    public var showMemberName: Swift.Bool?
    /// Creates a new `SubtaskSchemaOptions`.
    ///
    /// - Parameters:
    ///   - format:
    ///   - showMemberName:
    public init(
        format: Swift.String? = nil,
        showMemberName: Swift.Bool? = nil,
    ) {
        self.format = format
        self.showMemberName = showMemberName
    }

    public enum CodingKeys: String, CodingKey {
        case format
        case showMemberName = "show_member_name"
    }
}
