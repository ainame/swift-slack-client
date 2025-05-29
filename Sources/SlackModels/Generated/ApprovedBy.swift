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

/// - Remark: Generated from `#/components/schemas/ApprovedBy`.
public struct ApprovedBy: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ApprovedBy/actor_id`.
    public var actorId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ApprovedBy/actor_type`.
    public var actorType: Swift.String?
    /// Creates a new `ApprovedBy`.
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

    public enum CodingKeys: String, CodingKey {
        case actorId = "actor_id"
        case actorType = "actor_type"
    }
}
