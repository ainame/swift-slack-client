@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/Member`.
public struct Member: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Member/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Member/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Member/deleted`.
    public var deleted: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Member/color`.
    public var color: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Member/tz`.
    public var tz: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Member/profile`.
    public var profile: Profile?
    /// - Remark: Generated from `#/components/schemas/Member/updated`.
    public var updated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Member/locale`.
    public var locale: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Member/teamId`.
    public var teamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Member/realName`.
    public var realName: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Member/tzLabel`.
    public var tzLabel: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Member/tzOffset`.
    public var tzOffset: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Member/isAdmin`.
    public var isAdmin: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Member/isOwner`.
    public var isOwner: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Member/isPrimaryOwner`.
    public var isPrimaryOwner: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Member/isRestricted`.
    public var isRestricted: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Member/isUltraRestricted`.
    public var isUltraRestricted: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Member/isBot`.
    public var isBot: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Member/isAppUser`.
    public var isAppUser: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Member/isEmailConfirmed`.
    public var isEmailConfirmed: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Member/whoCanShareContactCard`.
    public var whoCanShareContactCard: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Member/isWorkflowBot`.
    public var isWorkflowBot: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Member/has2fa`.
    public var has2fa: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Member/enterpriseUser`.
    public var enterpriseUser: EnterpriseUser?
    /// - Remark: Generated from `#/components/schemas/Member/isInvitedUser`.
    public var isInvitedUser: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Member/isConnectorBot`.
    public var isConnectorBot: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Member/twoFactorType`.
    public var twoFactorType: Swift.String?
    /// Creates a new `Member`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - name:
    ///   - deleted:
    ///   - color:
    ///   - tz:
    ///   - profile:
    ///   - updated:
    ///   - locale:
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
    ///   - isEmailConfirmed:
    ///   - whoCanShareContactCard:
    ///   - isWorkflowBot:
    ///   - has2fa:
    ///   - enterpriseUser:
    ///   - isInvitedUser:
    ///   - isConnectorBot:
    ///   - twoFactorType:
    public init(
        id: Swift.String? = nil,
        name: Swift.String? = nil,
        deleted: Swift.Bool? = nil,
        color: Swift.String? = nil,
        tz: Swift.String? = nil,
        profile: Profile? = nil,
        updated: Swift.Int? = nil,
        locale: Swift.String? = nil,
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
        isEmailConfirmed: Swift.Bool? = nil,
        whoCanShareContactCard: Swift.String? = nil,
        isWorkflowBot: Swift.Bool? = nil,
        has2fa: Swift.Bool? = nil,
        enterpriseUser: EnterpriseUser? = nil,
        isInvitedUser: Swift.Bool? = nil,
        isConnectorBot: Swift.Bool? = nil,
        twoFactorType: Swift.String? = nil
    ) {
        self.id = id
        self.name = name
        self.deleted = deleted
        self.color = color
        self.tz = tz
        self.profile = profile
        self.updated = updated
        self.locale = locale
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
        self.isEmailConfirmed = isEmailConfirmed
        self.whoCanShareContactCard = whoCanShareContactCard
        self.isWorkflowBot = isWorkflowBot
        self.has2fa = has2fa
        self.enterpriseUser = enterpriseUser
        self.isInvitedUser = isInvitedUser
        self.isConnectorBot = isConnectorBot
        self.twoFactorType = twoFactorType
    }
}
