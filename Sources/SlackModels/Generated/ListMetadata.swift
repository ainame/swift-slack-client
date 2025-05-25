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
    /// - Remark: Generated from `#/components/schemas/ListMetadata/icon`.
    public var icon: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/description`.
    public var description: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/schema`.
    public var schema: [Schema]?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/views`.
    public var views: [ViewType]?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/integrations`.
    public var integrations: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/iconUrl`.
    public var iconUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/iconTeamId`.
    public var iconTeamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/isTrial`.
    public var isTrial: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/creationSource`.
    public var creationSource: CreationSource?
    /// - Remark: Generated from `#/components/schemas/ListMetadata/descriptionBlocks`.
    public var descriptionBlocks: [BlockType]?
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
        schema: [Schema]? = nil,
        views: [ViewType]? = nil,
        integrations: [Swift.String]? = nil,
        iconUrl: Swift.String? = nil,
        iconTeamId: Swift.String? = nil,
        isTrial: Swift.Bool? = nil,
        creationSource: CreationSource? = nil,
        descriptionBlocks: [BlockType]? = nil
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
