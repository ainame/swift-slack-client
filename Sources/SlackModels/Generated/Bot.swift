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

/// - Remark: Generated from `#/components/schemas/Bot`.
public struct Bot: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Bot/id`.
    public var id: Id?
    /// - Remark: Generated from `#/components/schemas/Bot/deleted`.
    public var deleted: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Bot/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bot/updated`.
    public var updated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Bot/icons`.
    public var icons: SlackModels.BotIcons?
    /// - Remark: Generated from `#/components/schemas/Bot/appId`.
    public var appId: SlackModels.AppID?
    /// - Remark: Generated from `#/components/schemas/Bot/isWorkflowBot`.
    public var isWorkflowBot: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Bot/teamId`.
    public var teamId: Swift.String?
    /// Creates a new `Bot`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - deleted:
    ///   - name:
    ///   - updated:
    ///   - icons:
    ///   - appId:
    ///   - isWorkflowBot:
    ///   - teamId:
    public init(
        id: Id? = nil,
        deleted: Swift.Bool? = nil,
        name: Swift.String? = nil,
        updated: Swift.Int? = nil,
        icons: SlackModels.BotIcons? = nil,
        appId: SlackModels.AppID? = nil,
        isWorkflowBot: Swift.Bool? = nil,
        teamId: Swift.String? = nil
    ) {
        self.id = id
        self.deleted = deleted
        self.name = name
        self.updated = updated
        self.icons = icons
        self.appId = appId
        self.isWorkflowBot = isWorkflowBot
        self.teamId = teamId
    }
}
