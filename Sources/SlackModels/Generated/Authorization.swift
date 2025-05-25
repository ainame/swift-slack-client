#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#endif
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit

/// - Remark: Generated from `#/components/schemas/Authorization`.
public struct Authorization: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Authorization/enterpriseId`.
    public var enterpriseId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Authorization/teamId`.
    public var teamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Authorization/userId`.
    public var userId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Authorization/isBot`.
    public var isBot: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Authorization/isEnterpriseInstall`.
    public var isEnterpriseInstall: Swift.Bool?
    /// Creates a new `Authorization`.
    ///
    /// - Parameters:
    ///   - enterpriseId:
    ///   - teamId:
    ///   - userId:
    ///   - isBot:
    ///   - isEnterpriseInstall:
    public init(
        enterpriseId: Swift.String? = nil,
        teamId: Swift.String? = nil,
        userId: Swift.String? = nil,
        isBot: Swift.Bool? = nil,
        isEnterpriseInstall: Swift.Bool? = nil
    ) {
        self.enterpriseId = enterpriseId
        self.teamId = teamId
        self.userId = userId
        self.isBot = isBot
        self.isEnterpriseInstall = isEnterpriseInstall
    }
}
