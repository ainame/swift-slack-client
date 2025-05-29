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

/// - Remark: Generated from `#/components/schemas/IngTeam`.
public struct IngTeam: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/IngTeam/avatar_base_url`.
    public var avatarBaseUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/IngTeam/date_created`.
    public var dateCreated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/IngTeam/domain`.
    public var domain: Swift.String?
    /// - Remark: Generated from `#/components/schemas/IngTeam/icon`.
    public var icon: Icon?
    /// - Remark: Generated from `#/components/schemas/IngTeam/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/IngTeam/is_verified`.
    public var isVerified: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/IngTeam/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/IngTeam/requires_sponsorship`.
    public var requiresSponsorship: Swift.Bool?
    /// Creates a new `IngTeam`.
    ///
    /// - Parameters:
    ///   - avatarBaseUrl:
    ///   - dateCreated:
    ///   - domain:
    ///   - icon:
    ///   - id:
    ///   - isVerified:
    ///   - name:
    ///   - requiresSponsorship:
    public init(
        avatarBaseUrl: Swift.String? = nil,
        dateCreated: Swift.Int? = nil,
        domain: Swift.String? = nil,
        icon: Icon? = nil,
        id: Swift.String? = nil,
        isVerified: Swift.Bool? = nil,
        name: Swift.String? = nil,
        requiresSponsorship: Swift.Bool? = nil
    ) {
        self.avatarBaseUrl = avatarBaseUrl
        self.dateCreated = dateCreated
        self.domain = domain
        self.icon = icon
        self.id = id
        self.isVerified = isVerified
        self.name = name
        self.requiresSponsorship = requiresSponsorship
    }

    public enum CodingKeys: String, CodingKey {
        case avatarBaseUrl = "avatar_base_url"
        case dateCreated = "date_created"
        case domain
        case icon
        case id
        case isVerified = "is_verified"
        case name
        case requiresSponsorship = "requires_sponsorship"
    }
}
