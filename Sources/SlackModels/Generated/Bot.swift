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

/// - Remark: Generated from `#/components/schemas/Bot`.
public struct Bot: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Bot/app_id`.
    public var appId: AppID?
    /// - Remark: Generated from `#/components/schemas/Bot/deleted`.
    public var deleted: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Bot/icons`.
    public var icons: BotIcons?
    /// - Remark: Generated from `#/components/schemas/Bot/id`.
    public var id: Id?
    /// - Remark: Generated from `#/components/schemas/Bot/is_workflow_bot`.
    public var isWorkflowBot: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Bot/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bot/team_id`.
    public var teamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bot/updated`.
    public var updated: Swift.Int?
    /// Creates a new `Bot`.
    ///
    /// - Parameters:
    ///   - appId:
    ///   - deleted:
    ///   - icons:
    ///   - id:
    ///   - isWorkflowBot:
    ///   - name:
    ///   - teamId:
    ///   - updated:
    public init(
        appId: AppID? = nil,
        deleted: Swift.Bool? = nil,
        icons: BotIcons? = nil,
        id: Id? = nil,
        isWorkflowBot: Swift.Bool? = nil,
        name: Swift.String? = nil,
        teamId: Swift.String? = nil,
        updated: Swift.Int? = nil
    ) {
        self.appId = appId
        self.deleted = deleted
        self.icons = icons
        self.id = id
        self.isWorkflowBot = isWorkflowBot
        self.name = name
        self.teamId = teamId
        self.updated = updated
    }
    public enum CodingKeys: String, CodingKey {
        case appId = "app_id"
        case deleted
        case icons
        case id
        case isWorkflowBot = "is_workflow_bot"
        case name
        case teamId = "team_id"
        case updated
    }
}
