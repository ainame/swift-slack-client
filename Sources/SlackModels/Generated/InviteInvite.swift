#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif
#endif

/// - Remark: Generated from `#/components/schemas/InviteInvite`.
public struct InviteInvite: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/InviteInvite/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InviteInvite/link`.
    public var link: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InviteInvite/sig`.
    public var sig: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InviteInvite/dateCreated`.
    public var dateCreated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InviteInvite/dateInvalid`.
    public var dateInvalid: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InviteInvite/invitingTeam`.
    public var invitingTeam: SlackModels.IngTeam?
    /// - Remark: Generated from `#/components/schemas/InviteInvite/invitingUser`.
    public var invitingUser: SlackModels.TingUser?
    /// - Remark: Generated from `#/components/schemas/InviteInvite/recipientUserId`.
    public var recipientUserId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InviteInvite/recipientEmail`.
    public var recipientEmail: Swift.String?
    /// Creates a new `InviteInvite`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - link:
    ///   - sig:
    ///   - dateCreated:
    ///   - dateInvalid:
    ///   - invitingTeam:
    ///   - invitingUser:
    ///   - recipientUserId:
    ///   - recipientEmail:
    public init(
        id: Swift.String? = nil,
        link: Swift.String? = nil,
        sig: Swift.String? = nil,
        dateCreated: Swift.Int? = nil,
        dateInvalid: Swift.Int? = nil,
        invitingTeam: SlackModels.IngTeam? = nil,
        invitingUser: SlackModels.TingUser? = nil,
        recipientUserId: Swift.String? = nil,
        recipientEmail: Swift.String? = nil
    ) {
        self.id = id
        self.link = link
        self.sig = sig
        self.dateCreated = dateCreated
        self.dateInvalid = dateInvalid
        self.invitingTeam = invitingTeam
        self.invitingUser = invitingUser
        self.recipientUserId = recipientUserId
        self.recipientEmail = recipientEmail
    }
}
