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
    /// - Remark: Generated from `#/components/schemas/InviteRequest/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InviteRequest/channel`.
    public var channel: Channel?
    /// - Remark: Generated from `#/components/schemas/InviteRequest/dateCreated`.
    public var dateCreated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InviteRequest/expiresAt`.
    public var expiresAt: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InviteRequest/invitingTeam`.
    public var invitingTeam: Team?
    /// - Remark: Generated from `#/components/schemas/InviteRequest/invitingUser`.
    public var invitingUser: InvitingUser?
    /// - Remark: Generated from `#/components/schemas/InviteRequest/isExternalLimited`.
    public var isExternalLimited: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/InviteRequest/dateLastUpdated`.
    public var dateLastUpdated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InviteRequest/targetUser`.
    public var targetUser: TargetUser?
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
        channel: Channel? = nil,
        dateCreated: Swift.Int? = nil,
        expiresAt: Swift.Int? = nil,
        invitingTeam: Team? = nil,
        invitingUser: InvitingUser? = nil,
        isExternalLimited: Swift.Bool? = nil,
        dateLastUpdated: Swift.Int? = nil,
        targetUser: TargetUser? = nil
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
