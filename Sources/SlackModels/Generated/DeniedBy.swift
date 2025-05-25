#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#endif
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit

/// - Remark: Generated from `#/components/schemas/DeniedBy`.
public struct DeniedBy: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/DeniedBy/actorType`.
    public var actorType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/DeniedBy/actorId`.
    public var actorId: Swift.String?
    /// Creates a new `DeniedBy`.
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
