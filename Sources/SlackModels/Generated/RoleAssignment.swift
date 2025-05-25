@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/RoleAssignment`.
public struct RoleAssignment: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/RoleAssignment/roleId`.
    public var roleId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/RoleAssignment/entityId`.
    public var entityId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/RoleAssignment/userId`.
    public var userId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/RoleAssignment/dateCreate`.
    public var dateCreate: Swift.Int?
    /// Creates a new `RoleAssignment`.
    ///
    /// - Parameters:
    ///   - roleId:
    ///   - entityId:
    ///   - userId:
    ///   - dateCreate:
    public init(
        roleId: Swift.String? = nil,
        entityId: Swift.String? = nil,
        userId: Swift.String? = nil,
        dateCreate: Swift.Int? = nil
    ) {
        self.roleId = roleId
        self.entityId = entityId
        self.userId = userId
        self.dateCreate = dateCreate
    }
}
