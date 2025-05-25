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

/// - Remark: Generated from `#/components/schemas/OauthConfig`.
public struct OauthConfig: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/OauthConfig/scopes`.
    public var scopes: SlackModels.Scopes?
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
        scopes: SlackModels.Scopes? = nil,
        redirectUrls: [Swift.String]? = nil,
        tokenManagementEnabled: Swift.Bool? = nil
    ) {
        self.scopes = scopes
        self.redirectUrls = redirectUrls
        self.tokenManagementEnabled = tokenManagementEnabled
    }
}
