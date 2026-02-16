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

/// - Remark: Generated from `#/components/schemas/InviteRequest`.
public struct InviteRequest: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/InviteRequest/channel`.
    public var channel: Channel?
    /// - Remark: Generated from `#/components/schemas/InviteRequest/date_created`.
    public var dateCreated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InviteRequest/date_last_updated`.
    public var dateLastUpdated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InviteRequest/expires_at`.
    public var expiresAt: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InviteRequest/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InviteRequest/inviting_team`.
    public var invitingTeam: Team?
    /// - Remark: Generated from `#/components/schemas/InviteRequest/inviting_user`.
    public var invitingUser: InvitingUser?
    /// - Remark: Generated from `#/components/schemas/InviteRequest/is_external_limited`.
    public var isExternalLimited: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/InviteRequest/target_user`.
    public var targetUser: TargetUser?
    /// Creates a new `InviteRequest`.
    ///
    /// - Parameters:
    ///   - channel:
    ///   - dateCreated:
    ///   - dateLastUpdated:
    ///   - expiresAt:
    ///   - id:
    ///   - invitingTeam:
    ///   - invitingUser:
    ///   - isExternalLimited:
    ///   - targetUser:
    public init(
        channel: Channel? = nil,
        dateCreated: Swift.Int? = nil,
        dateLastUpdated: Swift.Int? = nil,
        expiresAt: Swift.Int? = nil,
        id: Swift.String? = nil,
        invitingTeam: Team? = nil,
        invitingUser: InvitingUser? = nil,
        isExternalLimited: Swift.Bool? = nil,
        targetUser: TargetUser? = nil
    ) {
        self.channel = channel
        self.dateCreated = dateCreated
        self.dateLastUpdated = dateLastUpdated
        self.expiresAt = expiresAt
        self.id = id
        self.invitingTeam = invitingTeam
        self.invitingUser = invitingUser
        self.isExternalLimited = isExternalLimited
        self.targetUser = targetUser
    }
    public enum CodingKeys: String, CodingKey {
        case channel
        case dateCreated = "date_created"
        case dateLastUpdated = "date_last_updated"
        case expiresAt = "expires_at"
        case id
        case invitingTeam = "inviting_team"
        case invitingUser = "inviting_user"
        case isExternalLimited = "is_external_limited"
        case targetUser = "target_user"
    }
}
