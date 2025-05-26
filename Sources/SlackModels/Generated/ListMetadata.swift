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
    public var descriptionBlocks: [BlockType]?
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
    public var views: [ViewType]?
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
        descriptionBlocks: [BlockType]? = nil,
        icon: Swift.String? = nil,
        iconTeamId: Swift.String? = nil,
        iconUrl: Swift.String? = nil,
        integrations: [Swift.String]? = nil,
        isTrial: Swift.Bool? = nil,
        schema: [Schema]? = nil,
        views: [ViewType]? = nil
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
