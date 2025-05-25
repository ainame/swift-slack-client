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

/// - Remark: Generated from `#/components/schemas/Bookmark`.
public struct Bookmark: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Bookmark/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/title`.
    public var title: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/link`.
    public var link: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/emoji`.
    public var emoji: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/type`.
    public var type: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/rank`.
    public var rank: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/channelId`.
    public var channelId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/iconUrl`.
    public var iconUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/entityId`.
    public var entityId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/dateCreated`.
    public var dateCreated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Bookmark/dateUpdated`.
    public var dateUpdated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Bookmark/lastUpdatedByUserId`.
    public var lastUpdatedByUserId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/lastUpdatedByTeamId`.
    public var lastUpdatedByTeamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/shortcutId`.
    public var shortcutId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/appId`.
    public var appId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/appActionId`.
    public var appActionId: Swift.String?
    /// Creates a new `Bookmark`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - title:
    ///   - link:
    ///   - emoji:
    ///   - type:
    ///   - rank:
    ///   - channelId:
    ///   - iconUrl:
    ///   - entityId:
    ///   - dateCreated:
    ///   - dateUpdated:
    ///   - lastUpdatedByUserId:
    ///   - lastUpdatedByTeamId:
    ///   - shortcutId:
    ///   - appId:
    ///   - appActionId:
    public init(
        id: Swift.String? = nil,
        title: Swift.String? = nil,
        link: Swift.String? = nil,
        emoji: Swift.String? = nil,
        type: Swift.String? = nil,
        rank: Swift.String? = nil,
        channelId: Swift.String? = nil,
        iconUrl: Swift.String? = nil,
        entityId: Swift.String? = nil,
        dateCreated: Swift.Int? = nil,
        dateUpdated: Swift.Int? = nil,
        lastUpdatedByUserId: Swift.String? = nil,
        lastUpdatedByTeamId: Swift.String? = nil,
        shortcutId: Swift.String? = nil,
        appId: Swift.String? = nil,
        appActionId: Swift.String? = nil
    ) {
        self.id = id
        self.title = title
        self.link = link
        self.emoji = emoji
        self.type = type
        self.rank = rank
        self.channelId = channelId
        self.iconUrl = iconUrl
        self.entityId = entityId
        self.dateCreated = dateCreated
        self.dateUpdated = dateUpdated
        self.lastUpdatedByUserId = lastUpdatedByUserId
        self.lastUpdatedByTeamId = lastUpdatedByTeamId
        self.shortcutId = shortcutId
        self.appId = appId
        self.appActionId = appActionId
    }
}
