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

/// - Remark: Generated from `#/components/schemas/InvitingUser`.
public struct InvitingUser: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/InvitingUser/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InvitingUser/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InvitingUser/profile`.
    public var profile: Profile?
    /// - Remark: Generated from `#/components/schemas/InvitingUser/team_id`.
    public var teamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InvitingUser/updated`.
    public var updated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InvitingUser/who_can_share_contact_card`.
    public var whoCanShareContactCard: Swift.String?
    /// Creates a new `InvitingUser`.
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
        whoCanShareContactCard: Swift.String? = nil,
    ) {
        self.id = id
        self.name = name
        self.profile = profile
        self.teamId = teamId
        self.updated = updated
        self.whoCanShareContactCard = whoCanShareContactCard
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case name
        case profile
        case teamId = "team_id"
        case updated
        case whoCanShareContactCard = "who_can_share_contact_card"
    }
}
