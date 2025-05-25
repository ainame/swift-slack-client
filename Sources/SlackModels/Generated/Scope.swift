#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif
#endif

/// - Remark: Generated from `#/components/schemas/Scope`.
public struct Scope: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Scope/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Scope/description`.
    public var description: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Scope/isSensitive`.
    public var isSensitive: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Scope/tokenType`.
    public var tokenType: Swift.String?
    /// Creates a new `Scope`.
    ///
    /// - Parameters:
    ///   - name:
    ///   - description:
    ///   - isSensitive:
    ///   - tokenType:
    public init(
        name: Swift.String? = nil,
        description: Swift.String? = nil,
        isSensitive: Swift.Bool? = nil,
        tokenType: Swift.String? = nil
    ) {
        self.name = name
        self.description = description
        self.isSensitive = isSensitive
        self.tokenType = tokenType
    }
}
