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

/// - Remark: Generated from `#/components/schemas/RoleAssignment`.
public struct RoleAssignment: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/RoleAssignment/date_create`.
    public var dateCreate: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/RoleAssignment/entity_id`.
    public var entityId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/RoleAssignment/role_id`.
    public var roleId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/RoleAssignment/user_id`.
    public var userId: Swift.String?
    /// Creates a new `RoleAssignment`.
    ///
    /// - Parameters:
    ///   - dateCreate:
    ///   - entityId:
    ///   - roleId:
    ///   - userId:
    public init(
        dateCreate: Swift.Int? = nil,
        entityId: Swift.String? = nil,
        roleId: Swift.String? = nil,
        userId: Swift.String? = nil
    ) {
        self.dateCreate = dateCreate
        self.entityId = entityId
        self.roleId = roleId
        self.userId = userId
    }
    public enum CodingKeys: String, CodingKey {
        case dateCreate = "date_create"
        case entityId = "entity_id"
        case roleId = "role_id"
        case userId = "user_id"
    }
}
