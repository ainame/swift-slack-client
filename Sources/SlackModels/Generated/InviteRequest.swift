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

/// - Remark: Generated from `#/components/schemas/InviteRequest`.
public struct InviteRequest: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/InviteRequest/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InviteRequest/channel`.
    public var channel: SlackModels.Channel?
    /// - Remark: Generated from `#/components/schemas/InviteRequest/dateCreated`.
    public var dateCreated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InviteRequest/expiresAt`.
    public var expiresAt: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InviteRequest/invitingTeam`.
    public var invitingTeam: SlackModels.Team?
    /// - Remark: Generated from `#/components/schemas/InviteRequest/invitingUser`.
    public var invitingUser: SlackModels.InvitingUser?
    /// - Remark: Generated from `#/components/schemas/InviteRequest/isExternalLimited`.
    public var isExternalLimited: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/InviteRequest/dateLastUpdated`.
    public var dateLastUpdated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InviteRequest/targetUser`.
    public var targetUser: SlackModels.TargetUser?
    /// Creates a new `InviteRequest`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - channel:
    ///   - dateCreated:
    ///   - expiresAt:
    ///   - invitingTeam:
    ///   - invitingUser:
    ///   - isExternalLimited:
    ///   - dateLastUpdated:
    ///   - targetUser:
    public init(
        id: Swift.String? = nil,
        channel: SlackModels.Channel? = nil,
        dateCreated: Swift.Int? = nil,
        expiresAt: Swift.Int? = nil,
        invitingTeam: SlackModels.Team? = nil,
        invitingUser: SlackModels.InvitingUser? = nil,
        isExternalLimited: Swift.Bool? = nil,
        dateLastUpdated: Swift.Int? = nil,
        targetUser: SlackModels.TargetUser? = nil
    ) {
        self.id = id
        self.channel = channel
        self.dateCreated = dateCreated
        self.expiresAt = expiresAt
        self.invitingTeam = invitingTeam
        self.invitingUser = invitingUser
        self.isExternalLimited = isExternalLimited
        self.dateLastUpdated = dateLastUpdated
        self.targetUser = targetUser
    }
}
