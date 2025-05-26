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

/// - Remark: Generated from `#/components/schemas/Authorization`.
public struct Authorization: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Authorization/enterprise_id`.
    public var enterpriseId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Authorization/is_bot`.
    public var isBot: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Authorization/is_enterprise_install`.
    public var isEnterpriseInstall: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Authorization/team_id`.
    public var teamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Authorization/user_id`.
    public var userId: Swift.String?
    /// Creates a new `Authorization`.
    ///
    /// - Parameters:
    ///   - enterpriseId:
    ///   - isBot:
    ///   - isEnterpriseInstall:
    ///   - teamId:
    ///   - userId:
    public init(
        enterpriseId: Swift.String? = nil,
        isBot: Swift.Bool? = nil,
        isEnterpriseInstall: Swift.Bool? = nil,
        teamId: Swift.String? = nil,
        userId: Swift.String? = nil
    ) {
        self.enterpriseId = enterpriseId
        self.isBot = isBot
        self.isEnterpriseInstall = isEnterpriseInstall
        self.teamId = teamId
        self.userId = userId
    }
}
