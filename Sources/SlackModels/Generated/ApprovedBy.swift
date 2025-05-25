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

/// - Remark: Generated from `#/components/schemas/ApprovedBy`.
public struct ApprovedBy: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ApprovedBy/actorType`.
    public var actorType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ApprovedBy/actorId`.
    public var actorId: Swift.String?
    /// Creates a new `ApprovedBy`.
    ///
    /// - Parameters:
    ///   - actorType:
    ///   - actorId:
    public init(
        actorType: Swift.String? = nil,
        actorId: Swift.String? = nil
    ) {
        self.actorType = actorType
        self.actorId = actorId
    }
}
