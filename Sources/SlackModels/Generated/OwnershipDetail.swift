#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif
#endif

/// - Remark: Generated from `#/components/schemas/OwnershipDetail`.
public struct OwnershipDetail: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/OwnershipDetail/count`.
    public var count: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/OwnershipDetail/teamId`.
    public var teamId: Swift.String?
    /// Creates a new `OwnershipDetail`.
    ///
    /// - Parameters:
    ///   - count:
    ///   - teamId:
    public init(
        count: Swift.Int? = nil,
        teamId: Swift.String? = nil
    ) {
        self.count = count
        self.teamId = teamId
    }
}
