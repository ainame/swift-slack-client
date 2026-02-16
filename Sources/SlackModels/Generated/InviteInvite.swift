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

/// - Remark: Generated from `#/components/schemas/InviteInvite`.
public struct InviteInvite: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/InviteInvite/date_created`.
    public var dateCreated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InviteInvite/date_invalid`.
    public var dateInvalid: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InviteInvite/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InviteInvite/inviting_team`.
    public var invitingTeam: IngTeam?
    /// - Remark: Generated from `#/components/schemas/InviteInvite/inviting_user`.
    public var invitingUser: TingUser?
    /// - Remark: Generated from `#/components/schemas/InviteInvite/link`.
    public var link: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InviteInvite/recipient_email`.
    public var recipientEmail: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InviteInvite/recipient_user_id`.
    public var recipientUserId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InviteInvite/sig`.
    public var sig: Swift.String?
    /// Creates a new `InviteInvite`.
    ///
    /// - Parameters:
    ///   - dateCreated:
    ///   - dateInvalid:
    ///   - id:
    ///   - invitingTeam:
    ///   - invitingUser:
    ///   - link:
    ///   - recipientEmail:
    ///   - recipientUserId:
    ///   - sig:
    public init(
        dateCreated: Swift.Int? = nil,
        dateInvalid: Swift.Int? = nil,
        id: Swift.String? = nil,
        invitingTeam: IngTeam? = nil,
        invitingUser: TingUser? = nil,
        link: Swift.String? = nil,
        recipientEmail: Swift.String? = nil,
        recipientUserId: Swift.String? = nil,
        sig: Swift.String? = nil
    ) {
        self.dateCreated = dateCreated
        self.dateInvalid = dateInvalid
        self.id = id
        self.invitingTeam = invitingTeam
        self.invitingUser = invitingUser
        self.link = link
        self.recipientEmail = recipientEmail
        self.recipientUserId = recipientUserId
        self.sig = sig
    }
    public enum CodingKeys: String, CodingKey {
        case dateCreated = "date_created"
        case dateInvalid = "date_invalid"
        case id
        case invitingTeam = "inviting_team"
        case invitingUser = "inviting_user"
        case link
        case recipientEmail = "recipient_email"
        case recipientUserId = "recipient_user_id"
        case sig
    }
}
