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

/// - Remark: Generated from `#/components/schemas/InvitingUser`.
public struct InvitingUser: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/InvitingUser/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InvitingUser/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InvitingUser/updated`.
    public var updated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InvitingUser/profile`.
    public var profile: SlackModels.Profile?
    /// - Remark: Generated from `#/components/schemas/InvitingUser/teamId`.
    public var teamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InvitingUser/whoCanShareContactCard`.
    public var whoCanShareContactCard: Swift.String?
    /// Creates a new `InvitingUser`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - name:
    ///   - updated:
    ///   - profile:
    ///   - teamId:
    ///   - whoCanShareContactCard:
    public init(
        id: Swift.String? = nil,
        name: Swift.String? = nil,
        updated: Swift.Int? = nil,
        profile: SlackModels.Profile? = nil,
        teamId: Swift.String? = nil,
        whoCanShareContactCard: Swift.String? = nil
    ) {
        self.id = id
        self.name = name
        self.updated = updated
        self.profile = profile
        self.teamId = teamId
        self.whoCanShareContactCard = whoCanShareContactCard
    }
}
