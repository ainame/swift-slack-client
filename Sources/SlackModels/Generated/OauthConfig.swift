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

/// - Remark: Generated from `#/components/schemas/OauthConfig`.
public struct OauthConfig: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/OauthConfig/scopes`.
    public var scopes: Scopes?
    /// - Remark: Generated from `#/components/schemas/OauthConfig/redirectUrls`.
    public var redirectUrls: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/OauthConfig/tokenManagementEnabled`.
    public var tokenManagementEnabled: Swift.Bool?
    /// Creates a new `OauthConfig`.
    ///
    /// - Parameters:
    ///   - scopes:
    ///   - redirectUrls:
    ///   - tokenManagementEnabled:
    public init(
        scopes: Scopes? = nil,
        redirectUrls: [Swift.String]? = nil,
        tokenManagementEnabled: Swift.Bool? = nil
    ) {
        self.scopes = scopes
        self.redirectUrls = redirectUrls
        self.tokenManagementEnabled = tokenManagementEnabled
    }
}
