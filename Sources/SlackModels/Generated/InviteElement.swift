@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/InviteElement`.
public struct InviteElement: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/InviteElement/direction`.
    public var direction: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InviteElement/status`.
    public var status: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InviteElement/invite`.
    public var invite: InviteInvite?
    /// - Remark: Generated from `#/components/schemas/InviteElement/channel`.
    public var channel: Channel?
    /// - Remark: Generated from `#/components/schemas/InviteElement/acceptances`.
    public var acceptances: [Acceptance]?
    /// - Remark: Generated from `#/components/schemas/InviteElement/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InviteElement/sig`.
    public var sig: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InviteElement/link`.
    public var link: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InviteElement/dateLastUpdated`.
    public var dateLastUpdated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InviteElement/inviteType`.
    public var inviteType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InviteElement/dateCreated`.
    public var dateCreated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InviteElement/dateInvalid`.
    public var dateInvalid: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InviteElement/invitingTeam`.
    public var invitingTeam: IngTeam?
    /// - Remark: Generated from `#/components/schemas/InviteElement/invitingUser`.
    public var invitingUser: TingUser?
    /// - Remark: Generated from `#/components/schemas/InviteElement/invitePayload`.
    public var invitePayload: InvitePayload?
    /// - Remark: Generated from `#/components/schemas/InviteElement/recipientUserId`.
    public var recipientUserId: Swift.String?
    /// Creates a new `InviteElement`.
    ///
    /// - Parameters:
    ///   - direction:
    ///   - status:
    ///   - invite:
    ///   - channel:
    ///   - acceptances:
    ///   - id:
    ///   - sig:
    ///   - link:
    ///   - dateLastUpdated:
    ///   - inviteType:
    ///   - dateCreated:
    ///   - dateInvalid:
    ///   - invitingTeam:
    ///   - invitingUser:
    ///   - invitePayload:
    ///   - recipientUserId:
    public init(
        direction: Swift.String? = nil,
        status: Swift.String? = nil,
        invite: InviteInvite? = nil,
        channel: Channel? = nil,
        acceptances: [Acceptance]? = nil,
        id: Swift.String? = nil,
        sig: Swift.String? = nil,
        link: Swift.String? = nil,
        dateLastUpdated: Swift.Int? = nil,
        inviteType: Swift.String? = nil,
        dateCreated: Swift.Int? = nil,
        dateInvalid: Swift.Int? = nil,
        invitingTeam: IngTeam? = nil,
        invitingUser: TingUser? = nil,
        invitePayload: InvitePayload? = nil,
        recipientUserId: Swift.String? = nil
    ) {
        self.direction = direction
        self.status = status
        self.invite = invite
        self.channel = channel
        self.acceptances = acceptances
        self.id = id
        self.sig = sig
        self.link = link
        self.dateLastUpdated = dateLastUpdated
        self.inviteType = inviteType
        self.dateCreated = dateCreated
        self.dateInvalid = dateInvalid
        self.invitingTeam = invitingTeam
        self.invitingUser = invitingUser
        self.invitePayload = invitePayload
        self.recipientUserId = recipientUserId
    }
}
