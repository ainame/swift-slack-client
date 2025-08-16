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

/// - Remark: Generated from `#/components/schemas/Barrier`.
public struct Barrier: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Barrier/barriered_from_usergroups`.
    public var barrieredFromUsergroups: [Usergroup]?
    /// - Remark: Generated from `#/components/schemas/Barrier/date_update`.
    public var dateUpdate: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Barrier/enterprise_id`.
    public var enterpriseId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Barrier/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Barrier/primary_usergroup`.
    public var primaryUsergroup: Usergroup?
    /// - Remark: Generated from `#/components/schemas/Barrier/restricted_subjects`.
    public var restrictedSubjects: [Swift.String]?
    /// Creates a new `Barrier`.
    ///
    /// - Parameters:
    ///   - barrieredFromUsergroups:
    ///   - dateUpdate:
    ///   - enterpriseId:
    ///   - id:
    ///   - primaryUsergroup:
    ///   - restrictedSubjects:
    public init(
        barrieredFromUsergroups: [Usergroup]? = nil,
        dateUpdate: Swift.Int? = nil,
        enterpriseId: Swift.String? = nil,
        id: Swift.String? = nil,
        primaryUsergroup: Usergroup? = nil,
        restrictedSubjects: [Swift.String]? = nil,
    ) {
        self.barrieredFromUsergroups = barrieredFromUsergroups
        self.dateUpdate = dateUpdate
        self.enterpriseId = enterpriseId
        self.id = id
        self.primaryUsergroup = primaryUsergroup
        self.restrictedSubjects = restrictedSubjects
    }

    public enum CodingKeys: String, CodingKey {
        case barrieredFromUsergroups = "barriered_from_usergroups"
        case dateUpdate = "date_update"
        case enterpriseId = "enterprise_id"
        case id
        case primaryUsergroup = "primary_usergroup"
        case restrictedSubjects = "restricted_subjects"
    }
}
