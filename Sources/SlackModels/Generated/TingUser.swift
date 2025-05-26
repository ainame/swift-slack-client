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

/// - Remark: Generated from `#/components/schemas/TingUser`.
public struct TingUser: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/TingUser/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/TingUser/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/TingUser/profile`.
    public var profile: Profile?
    /// - Remark: Generated from `#/components/schemas/TingUser/team_id`.
    public var teamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/TingUser/updated`.
    public var updated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/TingUser/who_can_share_contact_card`.
    public var whoCanShareContactCard: Swift.String?
    /// Creates a new `TingUser`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - name:
    ///   - profile:
    ///   - teamId:
    ///   - updated:
    ///   - whoCanShareContactCard:
    public init(
        id: Swift.String? = nil,
        name: Swift.String? = nil,
        profile: Profile? = nil,
        teamId: Swift.String? = nil,
        updated: Swift.Int? = nil,
        whoCanShareContactCard: Swift.String? = nil
    ) {
        self.id = id
        self.name = name
        self.profile = profile
        self.teamId = teamId
        self.updated = updated
        self.whoCanShareContactCard = whoCanShareContactCard
    }
}
