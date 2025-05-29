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

/// - Remark: Generated from `#/components/schemas/UsergroupClude`.
public struct UsergroupClude: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/UsergroupClude/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/UsergroupClude/team_id`.
    public var teamId: Swift.String?
    /// Creates a new `UsergroupClude`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - teamId:
    public init(
        id: Swift.String? = nil,
        teamId: Swift.String? = nil
    ) {
        self.id = id
        self.teamId = teamId
    }

    public enum CodingKeys: String, CodingKey {
        case id
        case teamId = "team_id"
    }
}
