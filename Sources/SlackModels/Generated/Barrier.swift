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

/// - Remark: Generated from `#/components/schemas/Barrier`.
public struct Barrier: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Barrier/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Barrier/enterpriseId`.
    public var enterpriseId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Barrier/primaryUsergroup`.
    public var primaryUsergroup: Usergroup?
    /// - Remark: Generated from `#/components/schemas/Barrier/barrieredFromUsergroups`.
    public var barrieredFromUsergroups: [Usergroup]?
    /// - Remark: Generated from `#/components/schemas/Barrier/restrictedSubjects`.
    public var restrictedSubjects: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Barrier/dateUpdate`.
    public var dateUpdate: Swift.Int?
    /// Creates a new `Barrier`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - enterpriseId:
    ///   - primaryUsergroup:
    ///   - barrieredFromUsergroups:
    ///   - restrictedSubjects:
    ///   - dateUpdate:
    public init(
        id: Swift.String? = nil,
        enterpriseId: Swift.String? = nil,
        primaryUsergroup: Usergroup? = nil,
        barrieredFromUsergroups: [Usergroup]? = nil,
        restrictedSubjects: [Swift.String]? = nil,
        dateUpdate: Swift.Int? = nil
    ) {
        self.id = id
        self.enterpriseId = enterpriseId
        self.primaryUsergroup = primaryUsergroup
        self.barrieredFromUsergroups = barrieredFromUsergroups
        self.restrictedSubjects = restrictedSubjects
        self.dateUpdate = dateUpdate
    }
}
