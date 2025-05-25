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

/// - Remark: Generated from `#/components/schemas/Invite`.
public struct Invite: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Invite/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Invite/email`.
    public var email: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Invite/inviterId`.
    public var inviterId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Invite/dateCreated`.
    public var dateCreated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Invite/isBouncing`.
    public var isBouncing: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Invite/invitePreferences`.
    public var invitePreferences: SlackModels.InvitePreferences?
    /// Creates a new `Invite`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - email:
    ///   - inviterId:
    ///   - dateCreated:
    ///   - isBouncing:
    ///   - invitePreferences:
    public init(
        id: Swift.String? = nil,
        email: Swift.String? = nil,
        inviterId: Swift.String? = nil,
        dateCreated: Swift.Int? = nil,
        isBouncing: Swift.Bool? = nil,
        invitePreferences: SlackModels.InvitePreferences? = nil
    ) {
        self.id = id
        self.email = email
        self.inviterId = inviterId
        self.dateCreated = dateCreated
        self.isBouncing = isBouncing
        self.invitePreferences = invitePreferences
    }
}
