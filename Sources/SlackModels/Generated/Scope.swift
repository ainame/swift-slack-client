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
        tokenType: Swift.String? = nil
    ) {
        self.description = description
        self.isSensitive = isSensitive
        self.name = name
        self.tokenType = tokenType
    }
}
