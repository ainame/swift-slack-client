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

/// - Remark: Generated from `#/components/schemas/Usergroup`.
public struct Usergroup: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Usergroup/auto_provision`.
    public var autoProvision: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Usergroup/channel_count`.
    public var channelCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Usergroup/created_by`.
    public var createdBy: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Usergroup/date_create`.
    public var dateCreate: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Usergroup/date_delete`.
    public var dateDelete: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Usergroup/date_update`.
    public var dateUpdate: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Usergroup/description`.
    public var description: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Usergroup/enterprise_subteam_id`.
    public var enterpriseSubteamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Usergroup/handle`.
    public var handle: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Usergroup/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Usergroup/is_external`.
    public var isExternal: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Usergroup/is_section`.
    public var isSection: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Usergroup/is_subteam`.
    public var isSubteam: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Usergroup/is_usergroup`.
    public var isUsergroup: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Usergroup/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Usergroup/prefs`.
    public var prefs: Prefs?
    /// - Remark: Generated from `#/components/schemas/Usergroup/team_id`.
    public var teamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Usergroup/updated_by`.
    public var updatedBy: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Usergroup/users`.
    public var users: [Swift.String]?
    /// Creates a new `Usergroup`.
    ///
    /// - Parameters:
    ///   - autoProvision:
    ///   - channelCount:
    ///   - createdBy:
    ///   - dateCreate:
    ///   - dateDelete:
    ///   - dateUpdate:
    ///   - description:
    ///   - enterpriseSubteamId:
    ///   - handle:
    ///   - id:
    ///   - isExternal:
    ///   - isSection:
    ///   - isSubteam:
    ///   - isUsergroup:
    ///   - name:
    ///   - prefs:
    ///   - teamId:
    ///   - updatedBy:
    ///   - users:
    public init(
        autoProvision: Swift.Bool? = nil,
        channelCount: Swift.Int? = nil,
        createdBy: Swift.String? = nil,
        dateCreate: Swift.Int? = nil,
        dateDelete: Swift.Int? = nil,
        dateUpdate: Swift.Int? = nil,
        description: Swift.String? = nil,
        enterpriseSubteamId: Swift.String? = nil,
        handle: Swift.String? = nil,
        id: Swift.String? = nil,
        isExternal: Swift.Bool? = nil,
        isSection: Swift.Bool? = nil,
        isSubteam: Swift.Bool? = nil,
        isUsergroup: Swift.Bool? = nil,
        name: Swift.String? = nil,
        prefs: Prefs? = nil,
        teamId: Swift.String? = nil,
        updatedBy: Swift.String? = nil,
        users: [Swift.String]? = nil
    ) {
        self.autoProvision = autoProvision
        self.channelCount = channelCount
        self.createdBy = createdBy
        self.dateCreate = dateCreate
        self.dateDelete = dateDelete
        self.dateUpdate = dateUpdate
        self.description = description
        self.enterpriseSubteamId = enterpriseSubteamId
        self.handle = handle
        self.id = id
        self.isExternal = isExternal
        self.isSection = isSection
        self.isSubteam = isSubteam
        self.isUsergroup = isUsergroup
        self.name = name
        self.prefs = prefs
        self.teamId = teamId
        self.updatedBy = updatedBy
        self.users = users
    }

    public enum CodingKeys: String, CodingKey {
        case autoProvision = "auto_provision"
        case channelCount = "channel_count"
        case createdBy = "created_by"
        case dateCreate = "date_create"
        case dateDelete = "date_delete"
        case dateUpdate = "date_update"
        case description
        case enterpriseSubteamId = "enterprise_subteam_id"
        case handle
        case id
        case isExternal = "is_external"
        case isSection = "is_section"
        case isSubteam = "is_subteam"
        case isUsergroup = "is_usergroup"
        case name
        case prefs
        case teamId = "team_id"
        case updatedBy = "updated_by"
        case users
    }
}
