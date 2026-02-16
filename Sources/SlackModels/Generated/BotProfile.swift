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

/// - Remark: Generated from `#/components/schemas/BotProfile`.
public struct BotProfile: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/BotProfile/app_id`.
    public var appId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/BotProfile/deleted`.
    public var deleted: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/BotProfile/icons`.
    public var icons: Icons?
    /// - Remark: Generated from `#/components/schemas/BotProfile/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/BotProfile/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/BotProfile/team_id`.
    public var teamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/BotProfile/updated`.
    public var updated: Swift.Int?
    /// Creates a new `BotProfile`.
    ///
    /// - Parameters:
    ///   - appId:
    ///   - deleted:
    ///   - icons:
    ///   - id:
    ///   - name:
    ///   - teamId:
    ///   - updated:
    public init(
        appId: Swift.String? = nil,
        deleted: Swift.Bool? = nil,
        icons: Icons? = nil,
        id: Swift.String? = nil,
        name: Swift.String? = nil,
        teamId: Swift.String? = nil,
        updated: Swift.Int? = nil,
    ) {
        self.appId = appId
        self.deleted = deleted
        self.icons = icons
        self.id = id
        self.name = name
        self.teamId = teamId
        self.updated = updated
    }

    public enum CodingKeys: String, CodingKey {
        case appId = "app_id"
        case deleted
        case icons
        case id
        case name
        case teamId = "team_id"
        case updated
    }
}
