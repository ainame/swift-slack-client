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

/// - Remark: Generated from `#/components/schemas/Entity`.
public struct Entity: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Entity/entityId`.
    public var entityId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Entity/entityType`.
    public var entityType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Entity/dateAdded`.
    public var dateAdded: Swift.Int?
    /// Creates a new `Entity`.
    ///
    /// - Parameters:
    ///   - entityId:
    ///   - entityType:
    ///   - dateAdded:
    public init(
        entityId: Swift.String? = nil,
        entityType: Swift.String? = nil,
        dateAdded: Swift.Int? = nil
    ) {
        self.entityId = entityId
        self.entityType = entityType
        self.dateAdded = dateAdded
    }
}
