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

/// - Remark: Generated from `#/components/schemas/IngTeam`.
public struct IngTeam: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/IngTeam/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/IngTeam/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/IngTeam/icon`.
    public var icon: SlackModels.Icon?
    /// - Remark: Generated from `#/components/schemas/IngTeam/domain`.
    public var domain: Swift.String?
    /// - Remark: Generated from `#/components/schemas/IngTeam/isVerified`.
    public var isVerified: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/IngTeam/dateCreated`.
    public var dateCreated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/IngTeam/avatarBaseUrl`.
    public var avatarBaseUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/IngTeam/requiresSponsorship`.
    public var requiresSponsorship: Swift.Bool?
    /// Creates a new `IngTeam`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - name:
    ///   - icon:
    ///   - domain:
    ///   - isVerified:
    ///   - dateCreated:
    ///   - avatarBaseUrl:
    ///   - requiresSponsorship:
    public init(
        id: Swift.String? = nil,
        name: Swift.String? = nil,
        icon: SlackModels.Icon? = nil,
        domain: Swift.String? = nil,
        isVerified: Swift.Bool? = nil,
        dateCreated: Swift.Int? = nil,
        avatarBaseUrl: Swift.String? = nil,
        requiresSponsorship: Swift.Bool? = nil
    ) {
        self.id = id
        self.name = name
        self.icon = icon
        self.domain = domain
        self.isVerified = isVerified
        self.dateCreated = dateCreated
        self.avatarBaseUrl = avatarBaseUrl
        self.requiresSponsorship = requiresSponsorship
    }
}
