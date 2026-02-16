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

/// - Remark: Generated from `#/components/schemas/AuthedUser`.
public struct AuthedUser: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/AuthedUser/access_token`.
    public var accessToken: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AuthedUser/expires_in`.
    public var expiresIn: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/AuthedUser/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AuthedUser/refresh_token`.
    public var refreshToken: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AuthedUser/scope`.
    public var scope: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AuthedUser/token_type`.
    public var tokenType: Swift.String?
    /// Creates a new `AuthedUser`.
    ///
    /// - Parameters:
    ///   - accessToken:
    ///   - expiresIn:
    ///   - id:
    ///   - refreshToken:
    ///   - scope:
    ///   - tokenType:
    public init(
        accessToken: Swift.String? = nil,
        expiresIn: Swift.Int? = nil,
        id: Swift.String? = nil,
        refreshToken: Swift.String? = nil,
        scope: Swift.String? = nil,
        tokenType: Swift.String? = nil,
    ) {
        self.accessToken = accessToken
        self.expiresIn = expiresIn
        self.id = id
        self.refreshToken = refreshToken
        self.scope = scope
        self.tokenType = tokenType
    }

    public enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case expiresIn = "expires_in"
        case id
        case refreshToken = "refresh_token"
        case scope
        case tokenType = "token_type"
    }
}
