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

/// - Remark: Generated from `#/components/schemas/AuthedUser`.
public struct AuthedUser: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/AuthedUser/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AuthedUser/scope`.
    public var scope: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AuthedUser/tokenType`.
    public var tokenType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AuthedUser/accessToken`.
    public var accessToken: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AuthedUser/refreshToken`.
    public var refreshToken: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AuthedUser/expiresIn`.
    public var expiresIn: Swift.Int?
    /// Creates a new `AuthedUser`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - scope:
    ///   - tokenType:
    ///   - accessToken:
    ///   - refreshToken:
    ///   - expiresIn:
    public init(
        id: Swift.String? = nil,
        scope: Swift.String? = nil,
        tokenType: Swift.String? = nil,
        accessToken: Swift.String? = nil,
        refreshToken: Swift.String? = nil,
        expiresIn: Swift.Int? = nil
    ) {
        self.id = id
        self.scope = scope
        self.tokenType = tokenType
        self.accessToken = accessToken
        self.refreshToken = refreshToken
        self.expiresIn = expiresIn
    }
}
