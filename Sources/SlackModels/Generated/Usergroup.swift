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

/// - Remark: Generated from `#/components/schemas/Usergroup`.
public struct Usergroup: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Usergroup/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Usergroup/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Usergroup/description`.
    public var description: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Usergroup/handle`.
    public var handle: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Usergroup/prefs`.
    public var prefs: SlackModels.Prefs?
    /// - Remark: Generated from `#/components/schemas/Usergroup/users`.
    public var users: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Usergroup/teamId`.
    public var teamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Usergroup/isUsergroup`.
    public var isUsergroup: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Usergroup/isSubteam`.
    public var isSubteam: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Usergroup/isExternal`.
    public var isExternal: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Usergroup/dateCreate`.
    public var dateCreate: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Usergroup/dateUpdate`.
    public var dateUpdate: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Usergroup/dateDelete`.
    public var dateDelete: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Usergroup/autoProvision`.
    public var autoProvision: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Usergroup/enterpriseSubteamId`.
    public var enterpriseSubteamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Usergroup/createdBy`.
    public var createdBy: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Usergroup/updatedBy`.
    public var updatedBy: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Usergroup/channelCount`.
    public var channelCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Usergroup/isSection`.
    public var isSection: Swift.Bool?
    /// Creates a new `Usergroup`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - name:
    ///   - description:
    ///   - handle:
    ///   - prefs:
    ///   - users:
    ///   - teamId:
    ///   - isUsergroup:
    ///   - isSubteam:
    ///   - isExternal:
    ///   - dateCreate:
    ///   - dateUpdate:
    ///   - dateDelete:
    ///   - autoProvision:
    ///   - enterpriseSubteamId:
    ///   - createdBy:
    ///   - updatedBy:
    ///   - channelCount:
    ///   - isSection:
    public init(
        id: Swift.String? = nil,
        name: Swift.String? = nil,
        description: Swift.String? = nil,
        handle: Swift.String? = nil,
        prefs: SlackModels.Prefs? = nil,
        users: [Swift.String]? = nil,
        teamId: Swift.String? = nil,
        isUsergroup: Swift.Bool? = nil,
        isSubteam: Swift.Bool? = nil,
        isExternal: Swift.Bool? = nil,
        dateCreate: Swift.Int? = nil,
        dateUpdate: Swift.Int? = nil,
        dateDelete: Swift.Int? = nil,
        autoProvision: Swift.Bool? = nil,
        enterpriseSubteamId: Swift.String? = nil,
        createdBy: Swift.String? = nil,
        updatedBy: Swift.String? = nil,
        channelCount: Swift.Int? = nil,
        isSection: Swift.Bool? = nil
    ) {
        self.id = id
        self.name = name
        self.description = description
        self.handle = handle
        self.prefs = prefs
        self.users = users
        self.teamId = teamId
        self.isUsergroup = isUsergroup
        self.isSubteam = isSubteam
        self.isExternal = isExternal
        self.dateCreate = dateCreate
        self.dateUpdate = dateUpdate
        self.dateDelete = dateDelete
        self.autoProvision = autoProvision
        self.enterpriseSubteamId = enterpriseSubteamId
        self.createdBy = createdBy
        self.updatedBy = updatedBy
        self.channelCount = channelCount
        self.isSection = isSection
    }
}
