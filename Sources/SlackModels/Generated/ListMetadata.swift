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

#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

/// - Remark: Generated from `#/components/schemas/ListMetadata`.
public struct ListMetadata: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ListMetadata/creation_source`.
    public var creationSource: CreationSource?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/description`.
    public var description: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/description_blocks`.
    public var descriptionBlocks: [Block]?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/icon`.
    public var icon: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/icon_team_id`.
    public var iconTeamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/icon_url`.
    public var iconUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/integrations`.
    public var integrations: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/is_trial`.
    public var isTrial: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/schema`.
    public var schema: [Schema]?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/views`.
    public var views: [View]?
    /// Creates a new `ListMetadata`.
    ///
    /// - Parameters:
    ///   - creationSource:
    ///   - description:
    ///   - descriptionBlocks:
    ///   - icon:
    ///   - iconTeamId:
    ///   - iconUrl:
    ///   - integrations:
    ///   - isTrial:
    ///   - schema:
    ///   - views:
    public init(
        creationSource: CreationSource? = nil,
        description: Swift.String? = nil,
        descriptionBlocks: [Block]? = nil,
        icon: Swift.String? = nil,
        iconTeamId: Swift.String? = nil,
        iconUrl: Swift.String? = nil,
        integrations: [Swift.String]? = nil,
        isTrial: Swift.Bool? = nil,
        schema: [Schema]? = nil,
        views: [View]? = nil,
    ) {
        self.creationSource = creationSource
        self.description = description
        self.descriptionBlocks = descriptionBlocks
        self.icon = icon
        self.iconTeamId = iconTeamId
        self.iconUrl = iconUrl
        self.integrations = integrations
        self.isTrial = isTrial
        self.schema = schema
        self.views = views
    }

    public enum CodingKeys: String, CodingKey {
        case creationSource = "creation_source"
        case description
        case descriptionBlocks = "description_blocks"
        case icon
        case iconTeamId = "icon_team_id"
        case iconUrl = "icon_url"
        case integrations
        case isTrial = "is_trial"
        case schema
        case views
    }
}
