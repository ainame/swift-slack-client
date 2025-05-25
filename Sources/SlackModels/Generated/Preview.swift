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

/// - Remark: Generated from `#/components/schemas/Preview`.
public struct Preview: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Preview/type`.
    public var type: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Preview/title`.
    public var title: SlackModels.Description?
    /// - Remark: Generated from `#/components/schemas/Preview/subtitle`.
    public var subtitle: SlackModels.Description?
    /// - Remark: Generated from `#/components/schemas/Preview/canRemove`.
    public var canRemove: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Preview/iconUrl`.
    public var iconUrl: Swift.String?
    /// Creates a new `Preview`.
    ///
    /// - Parameters:
    ///   - type:
    ///   - title:
    ///   - subtitle:
    ///   - canRemove:
    ///   - iconUrl:
    public init(
        type: Swift.String? = nil,
        title: SlackModels.Description? = nil,
        subtitle: SlackModels.Description? = nil,
        canRemove: Swift.Bool? = nil,
        iconUrl: Swift.String? = nil
    ) {
        self.type = type
        self.title = title
        self.subtitle = subtitle
        self.canRemove = canRemove
        self.iconUrl = iconUrl
    }
}
