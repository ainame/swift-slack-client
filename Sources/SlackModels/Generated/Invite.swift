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

/// - Remark: Generated from `#/components/schemas/Invite`.
public struct Invite: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Invite/date_created`.
    public var dateCreated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Invite/email`.
    public var email: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Invite/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Invite/invite_preferences`.
    public var invitePreferences: InvitePreferences?
    /// - Remark: Generated from `#/components/schemas/Invite/inviter_id`.
    public var inviterId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Invite/is_bouncing`.
    public var isBouncing: Swift.Bool?
    /// Creates a new `Invite`.
    ///
    /// - Parameters:
    ///   - dateCreated:
    ///   - email:
    ///   - id:
    ///   - invitePreferences:
    ///   - inviterId:
    ///   - isBouncing:
    public init(
        dateCreated: Swift.Int? = nil,
        email: Swift.String? = nil,
        id: Swift.String? = nil,
        invitePreferences: InvitePreferences? = nil,
        inviterId: Swift.String? = nil,
        isBouncing: Swift.Bool? = nil
    ) {
        self.dateCreated = dateCreated
        self.email = email
        self.id = id
        self.invitePreferences = invitePreferences
        self.inviterId = inviterId
        self.isBouncing = isBouncing
    }

    public enum CodingKeys: String, CodingKey {
        case dateCreated = "date_created"
        case email
        case id
        case invitePreferences = "invite_preferences"
        case inviterId = "inviter_id"
        case isBouncing = "is_bouncing"
    }
}
