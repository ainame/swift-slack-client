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

/// - Remark: Generated from `#/components/schemas/EnterpriseUser`.
public struct EnterpriseUser: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/EnterpriseUser/enterprise_id`.
    public var enterpriseId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/EnterpriseUser/enterprise_name`.
    public var enterpriseName: Swift.String?
    /// - Remark: Generated from `#/components/schemas/EnterpriseUser/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/EnterpriseUser/is_admin`.
    public var isAdmin: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/EnterpriseUser/is_owner`.
    public var isOwner: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/EnterpriseUser/is_primary_owner`.
    public var isPrimaryOwner: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/EnterpriseUser/teams`.
    public var teams: [Swift.String]?
    /// Creates a new `EnterpriseUser`.
    ///
    /// - Parameters:
    ///   - enterpriseId:
    ///   - enterpriseName:
    ///   - id:
    ///   - isAdmin:
    ///   - isOwner:
    ///   - isPrimaryOwner:
    ///   - teams:
    public init(
        enterpriseId: Swift.String? = nil,
        enterpriseName: Swift.String? = nil,
        id: Swift.String? = nil,
        isAdmin: Swift.Bool? = nil,
        isOwner: Swift.Bool? = nil,
        isPrimaryOwner: Swift.Bool? = nil,
        teams: [Swift.String]? = nil
    ) {
        self.enterpriseId = enterpriseId
        self.enterpriseName = enterpriseName
        self.id = id
        self.isAdmin = isAdmin
        self.isOwner = isOwner
        self.isPrimaryOwner = isPrimaryOwner
        self.teams = teams
    }

    public enum CodingKeys: String, CodingKey {
        case enterpriseId = "enterprise_id"
        case enterpriseName = "enterprise_name"
        case id
        case isAdmin = "is_admin"
        case isOwner = "is_owner"
        case isPrimaryOwner = "is_primary_owner"
        case teams
    }
}
