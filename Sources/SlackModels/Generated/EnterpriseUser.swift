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

/// - Remark: Generated from `#/components/schemas/EnterpriseUser`.
public struct EnterpriseUser: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/EnterpriseUser/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/EnterpriseUser/teams`.
    public var teams: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/EnterpriseUser/enterpriseId`.
    public var enterpriseId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/EnterpriseUser/enterpriseName`.
    public var enterpriseName: Swift.String?
    /// - Remark: Generated from `#/components/schemas/EnterpriseUser/isAdmin`.
    public var isAdmin: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/EnterpriseUser/isOwner`.
    public var isOwner: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/EnterpriseUser/isPrimaryOwner`.
    public var isPrimaryOwner: Swift.Bool?
    /// Creates a new `EnterpriseUser`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - teams:
    ///   - enterpriseId:
    ///   - enterpriseName:
    ///   - isAdmin:
    ///   - isOwner:
    ///   - isPrimaryOwner:
    public init(
        id: Swift.String? = nil,
        teams: [Swift.String]? = nil,
        enterpriseId: Swift.String? = nil,
        enterpriseName: Swift.String? = nil,
        isAdmin: Swift.Bool? = nil,
        isOwner: Swift.Bool? = nil,
        isPrimaryOwner: Swift.Bool? = nil
    ) {
        self.id = id
        self.teams = teams
        self.enterpriseId = enterpriseId
        self.enterpriseName = enterpriseName
        self.isAdmin = isAdmin
        self.isOwner = isOwner
        self.isPrimaryOwner = isPrimaryOwner
    }
}
