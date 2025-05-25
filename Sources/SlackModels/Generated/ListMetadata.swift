#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

/// - Remark: Generated from `#/components/schemas/ListMetadata`.
public struct ListMetadata: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ListMetadata/icon`.
    public var icon: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/description`.
    public var description: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/schema`.
    public var schema: [SlackModels.Schema]?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/views`.
    public var views: [SlackBlockKit.ViewType]?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/integrations`.
    public var integrations: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/iconUrl`.
    public var iconUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/iconTeamId`.
    public var iconTeamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/isTrial`.
    public var isTrial: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/creationSource`.
    public var creationSource: SlackModels.CreationSource?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/descriptionBlocks`.
    public var descriptionBlocks: [SlackBlockKit.BlockType]?
    /// Creates a new `ListMetadata`.
    ///
    /// - Parameters:
    ///   - icon:
    ///   - description:
    ///   - schema:
    ///   - views:
    ///   - integrations:
    ///   - iconUrl:
    ///   - iconTeamId:
    ///   - isTrial:
    ///   - creationSource:
    ///   - descriptionBlocks:
    public init(
        icon: Swift.String? = nil,
        description: Swift.String? = nil,
        schema: [SlackModels.Schema]? = nil,
        views: [SlackBlockKit.ViewType]? = nil,
        integrations: [Swift.String]? = nil,
        iconUrl: Swift.String? = nil,
        iconTeamId: Swift.String? = nil,
        isTrial: Swift.Bool? = nil,
        creationSource: SlackModels.CreationSource? = nil,
        descriptionBlocks: [SlackBlockKit.BlockType]? = nil
    ) {
        self.icon = icon
        self.description = description
        self.schema = schema
        self.views = views
        self.integrations = integrations
        self.iconUrl = iconUrl
        self.iconTeamId = iconTeamId
        self.isTrial = isTrial
        self.creationSource = creationSource
        self.descriptionBlocks = descriptionBlocks
    }
}
