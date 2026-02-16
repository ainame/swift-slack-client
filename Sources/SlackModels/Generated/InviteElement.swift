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

/// - Remark: Generated from `#/components/schemas/InviteElement`.
public struct InviteElement: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/InviteElement/acceptances`.
    public var acceptances: [Acceptance]?
    /// - Remark: Generated from `#/components/schemas/InviteElement/channel`.
    public var channel: Channel?
    /// - Remark: Generated from `#/components/schemas/InviteElement/date_created`.
    public var dateCreated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InviteElement/date_invalid`.
    public var dateInvalid: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InviteElement/date_last_updated`.
    public var dateLastUpdated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InviteElement/direction`.
    public var direction: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InviteElement/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InviteElement/invite`.
    public var invite: InviteInvite?
    /// - Remark: Generated from `#/components/schemas/InviteElement/invite_payload`.
    public var invitePayload: InvitePayload?
    /// - Remark: Generated from `#/components/schemas/InviteElement/invite_type`.
    public var inviteType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InviteElement/inviting_team`.
    public var invitingTeam: IngTeam?
    /// - Remark: Generated from `#/components/schemas/InviteElement/inviting_user`.
    public var invitingUser: TingUser?
    /// - Remark: Generated from `#/components/schemas/InviteElement/link`.
    public var link: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InviteElement/recipient_user_id`.
    public var recipientUserId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InviteElement/sig`.
    public var sig: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InviteElement/status`.
    public var status: Swift.String?
    /// Creates a new `InviteElement`.
    ///
    /// - Parameters:
    ///   - acceptances:
    ///   - channel:
    ///   - dateCreated:
    ///   - dateInvalid:
    ///   - dateLastUpdated:
    ///   - direction:
    ///   - id:
    ///   - invite:
    ///   - invitePayload:
    ///   - inviteType:
    ///   - invitingTeam:
    ///   - invitingUser:
    ///   - link:
    ///   - recipientUserId:
    ///   - sig:
    ///   - status:
    public init(
        acceptances: [Acceptance]? = nil,
        channel: Channel? = nil,
        dateCreated: Swift.Int? = nil,
        dateInvalid: Swift.Int? = nil,
        dateLastUpdated: Swift.Int? = nil,
        direction: Swift.String? = nil,
        id: Swift.String? = nil,
        invite: InviteInvite? = nil,
        invitePayload: InvitePayload? = nil,
        inviteType: Swift.String? = nil,
        invitingTeam: IngTeam? = nil,
        invitingUser: TingUser? = nil,
        link: Swift.String? = nil,
        recipientUserId: Swift.String? = nil,
        sig: Swift.String? = nil,
        status: Swift.String? = nil,
    ) {
        self.acceptances = acceptances
        self.channel = channel
        self.dateCreated = dateCreated
        self.dateInvalid = dateInvalid
        self.dateLastUpdated = dateLastUpdated
        self.direction = direction
        self.id = id
        self.invite = invite
        self.invitePayload = invitePayload
        self.inviteType = inviteType
        self.invitingTeam = invitingTeam
        self.invitingUser = invitingUser
        self.link = link
        self.recipientUserId = recipientUserId
        self.sig = sig
        self.status = status
    }

    public enum CodingKeys: String, CodingKey {
        case acceptances
        case channel
        case dateCreated = "date_created"
        case dateInvalid = "date_invalid"
        case dateLastUpdated = "date_last_updated"
        case direction
        case id
        case invite
        case invitePayload = "invite_payload"
        case inviteType = "invite_type"
        case invitingTeam = "inviting_team"
        case invitingUser = "inviting_user"
        case link
        case recipientUserId = "recipient_user_id"
        case sig
        case status
    }
}
