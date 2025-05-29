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

/// - Remark: Generated from `#/components/schemas/Bookmark`.
public struct Bookmark: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Bookmark/app_action_id`.
    public var appActionId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/app_id`.
    public var appId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/channel_id`.
    public var channelId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/date_created`.
    public var dateCreated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Bookmark/date_updated`.
    public var dateUpdated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Bookmark/emoji`.
    public var emoji: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/entity_id`.
    public var entityId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/icon_url`.
    public var iconUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/last_updated_by_team_id`.
    public var lastUpdatedByTeamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/last_updated_by_user_id`.
    public var lastUpdatedByUserId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/link`.
    public var link: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/rank`.
    public var rank: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/shortcut_id`.
    public var shortcutId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/title`.
    public var title: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Bookmark/type`.
    public var _type: Swift.String
    /// Creates a new `Bookmark`.
    ///
    /// - Parameters:
    ///   - appActionId:
    ///   - appId:
    ///   - channelId:
    ///   - dateCreated:
    ///   - dateUpdated:
    ///   - emoji:
    ///   - entityId:
    ///   - iconUrl:
    ///   - id:
    ///   - lastUpdatedByTeamId:
    ///   - lastUpdatedByUserId:
    ///   - link:
    ///   - rank:
    ///   - shortcutId:
    ///   - title:
    ///   - _type:
    public init(
        appActionId: Swift.String? = nil,
        appId: Swift.String? = nil,
        channelId: Swift.String? = nil,
        dateCreated: Swift.Int? = nil,
        dateUpdated: Swift.Int? = nil,
        emoji: Swift.String? = nil,
        entityId: Swift.String? = nil,
        iconUrl: Swift.String? = nil,
        id: Swift.String? = nil,
        lastUpdatedByTeamId: Swift.String? = nil,
        lastUpdatedByUserId: Swift.String? = nil,
        link: Swift.String? = nil,
        rank: Swift.String? = nil,
        shortcutId: Swift.String? = nil,
        title: Swift.String? = nil,
        _type: Swift.String
    ) {
        self.appActionId = appActionId
        self.appId = appId
        self.channelId = channelId
        self.dateCreated = dateCreated
        self.dateUpdated = dateUpdated
        self.emoji = emoji
        self.entityId = entityId
        self.iconUrl = iconUrl
        self.id = id
        self.lastUpdatedByTeamId = lastUpdatedByTeamId
        self.lastUpdatedByUserId = lastUpdatedByUserId
        self.link = link
        self.rank = rank
        self.shortcutId = shortcutId
        self.title = title
        self._type = _type
    }

    public enum CodingKeys: String, CodingKey {
        case appActionId = "app_action_id"
        case appId = "app_id"
        case channelId = "channel_id"
        case dateCreated = "date_created"
        case dateUpdated = "date_updated"
        case emoji
        case entityId = "entity_id"
        case iconUrl = "icon_url"
        case id
        case lastUpdatedByTeamId = "last_updated_by_team_id"
        case lastUpdatedByUserId = "last_updated_by_user_id"
        case link
        case rank
        case shortcutId = "shortcut_id"
        case title
        case _type = "type"
    }
}
