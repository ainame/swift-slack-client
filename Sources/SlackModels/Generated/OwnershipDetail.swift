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

/// - Remark: Generated from `#/components/schemas/OwnershipDetail`.
public struct OwnershipDetail: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/OwnershipDetail/count`.
    public var count: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/OwnershipDetail/team_id`.
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
