@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/BotProfile`.
public struct BotProfile: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/BotProfile/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/BotProfile/deleted`.
    public var deleted: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/BotProfile/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/BotProfile/updated`.
    public var updated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/BotProfile/icons`.
    public var icons: Icons?
    /// - Remark: Generated from `#/components/schemas/BotProfile/appId`.
    public var appId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/BotProfile/teamId`.
    public var teamId: Swift.String?
    /// Creates a new `BotProfile`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - deleted:
    ///   - name:
    ///   - updated:
    ///   - icons:
    ///   - appId:
    ///   - teamId:
    public init(
        id: Swift.String? = nil,
        deleted: Swift.Bool? = nil,
        name: Swift.String? = nil,
        updated: Swift.Int? = nil,
        icons: Icons? = nil,
        appId: Swift.String? = nil,
        teamId: Swift.String? = nil
    ) {
        self.id = id
        self.deleted = deleted
        self.name = name
        self.updated = updated
        self.icons = icons
        self.appId = appId
        self.teamId = teamId
    }
}
