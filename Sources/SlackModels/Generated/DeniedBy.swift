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

/// - Remark: Generated from `#/components/schemas/DeniedBy`.
public struct DeniedBy: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/DeniedBy/actor_id`.
    public var actorId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/DeniedBy/actor_type`.
    public var actorType: Swift.String?
    /// Creates a new `DeniedBy`.
    ///
    /// - Parameters:
    ///   - actorId:
    ///   - actorType:
    public init(
        actorId: Swift.String? = nil,
        actorType: Swift.String? = nil
    ) {
        self.actorId = actorId
        self.actorType = actorType
    }
}
