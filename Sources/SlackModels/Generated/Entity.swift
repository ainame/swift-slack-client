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
    /// - Remark: Generated from `#/components/schemas/Entity/date_added`.
    public var dateAdded: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Entity/entity_id`.
    public var entityId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Entity/entity_type`.
    public var entityType: Swift.String?
    /// Creates a new `Entity`.
    ///
    /// - Parameters:
    ///   - dateAdded:
    ///   - entityId:
    ///   - entityType:
    public init(
        dateAdded: Swift.Int? = nil,
        entityId: Swift.String? = nil,
        entityType: Swift.String? = nil
    ) {
        self.dateAdded = dateAdded
        self.entityId = entityId
        self.entityType = entityType
    }
}
