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

/// - Remark: Generated from `#/components/schemas/Scope`.
public struct Scope: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Scope/description`.
    public var description: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Scope/is_sensitive`.
    public var isSensitive: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Scope/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Scope/token_type`.
    public var tokenType: Swift.String?
    /// Creates a new `Scope`.
    ///
    /// - Parameters:
    ///   - description:
    ///   - isSensitive:
    ///   - name:
    ///   - tokenType:
    public init(
        description: Swift.String? = nil,
        isSensitive: Swift.Bool? = nil,
        name: Swift.String? = nil,
        tokenType: Swift.String? = nil,
    ) {
        self.description = description
        self.isSensitive = isSensitive
        self.name = name
        self.tokenType = tokenType
    }

    public enum CodingKeys: String, CodingKey {
        case description
        case isSensitive = "is_sensitive"
        case name
        case tokenType = "token_type"
    }
}
