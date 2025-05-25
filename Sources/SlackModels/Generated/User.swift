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

/// - Remark: Generated from `#/components/schemas/User`.
public struct User: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/User/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/User/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/User/deleted`.
    public var deleted: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/User/color`.
    public var color: Swift.String?
    /// - Remark: Generated from `#/components/schemas/User/tz`.
    public var tz: Swift.String?
    /// - Remark: Generated from `#/components/schemas/User/profile`.
    public var profile: SlackModels.Profile?
    /// - Remark: Generated from `#/components/schemas/User/updated`.
    public var updated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/User/teamId`.
    public var teamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/User/realName`.
    public var realName: Swift.String?
    /// - Remark: Generated from `#/components/schemas/User/tzLabel`.
    public var tzLabel: Swift.String?
    /// - Remark: Generated from `#/components/schemas/User/tzOffset`.
    public var tzOffset: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/User/isAdmin`.
    public var isAdmin: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/User/isOwner`.
    public var isOwner: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/User/isPrimaryOwner`.
    public var isPrimaryOwner: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/User/isRestricted`.
    public var isRestricted: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/User/isUltraRestricted`.
    public var isUltraRestricted: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/User/isBot`.
    public var isBot: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/User/isAppUser`.
    public var isAppUser: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/User/has2fa`.
    public var has2fa: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/User/isEmailConfirmed`.
    public var isEmailConfirmed: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/User/whoCanShareContactCard`.
    public var whoCanShareContactCard: Swift.String?
    /// - Remark: Generated from `#/components/schemas/User/isInvitedUser`.
    public var isInvitedUser: Swift.Bool?
    /// Creates a new `User`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - name:
    ///   - deleted:
    ///   - color:
    ///   - tz:
    ///   - profile:
    ///   - updated:
    ///   - teamId:
    ///   - realName:
    ///   - tzLabel:
    ///   - tzOffset:
    ///   - isAdmin:
    ///   - isOwner:
    ///   - isPrimaryOwner:
    ///   - isRestricted:
    ///   - isUltraRestricted:
    ///   - isBot:
    ///   - isAppUser:
    ///   - has2fa:
    ///   - isEmailConfirmed:
    ///   - whoCanShareContactCard:
    ///   - isInvitedUser:
    public init(
        id: Swift.String? = nil,
        name: Swift.String? = nil,
        deleted: Swift.Bool? = nil,
        color: Swift.String? = nil,
        tz: Swift.String? = nil,
        profile: SlackModels.Profile? = nil,
        updated: Swift.Int? = nil,
        teamId: Swift.String? = nil,
        realName: Swift.String? = nil,
        tzLabel: Swift.String? = nil,
        tzOffset: Swift.Int? = nil,
        isAdmin: Swift.Bool? = nil,
        isOwner: Swift.Bool? = nil,
        isPrimaryOwner: Swift.Bool? = nil,
        isRestricted: Swift.Bool? = nil,
        isUltraRestricted: Swift.Bool? = nil,
        isBot: Swift.Bool? = nil,
        isAppUser: Swift.Bool? = nil,
        has2fa: Swift.Bool? = nil,
        isEmailConfirmed: Swift.Bool? = nil,
        whoCanShareContactCard: Swift.String? = nil,
        isInvitedUser: Swift.Bool? = nil
    ) {
        self.id = id
        self.name = name
        self.deleted = deleted
        self.color = color
        self.tz = tz
        self.profile = profile
        self.updated = updated
        self.teamId = teamId
        self.realName = realName
        self.tzLabel = tzLabel
        self.tzOffset = tzOffset
        self.isAdmin = isAdmin
        self.isOwner = isOwner
        self.isPrimaryOwner = isPrimaryOwner
        self.isRestricted = isRestricted
        self.isUltraRestricted = isUltraRestricted
        self.isBot = isBot
        self.isAppUser = isAppUser
        self.has2fa = has2fa
        self.isEmailConfirmed = isEmailConfirmed
        self.whoCanShareContactCard = whoCanShareContactCard
        self.isInvitedUser = isInvitedUser
    }
}
