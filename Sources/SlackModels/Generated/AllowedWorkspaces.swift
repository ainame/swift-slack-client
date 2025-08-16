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

/// - Remark: Generated from `#/components/schemas/AllowedWorkspaces`.
public struct AllowedWorkspaces: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/AllowedWorkspaces/actor`.
    public var actor: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AllowedWorkspaces/date_update`.
    public var dateUpdate: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/AllowedWorkspaces/source`.
    public var source: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AllowedWorkspaces/team_ids`.
    public var teamIds: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/AllowedWorkspaces/type`.
    public var _type: Swift.String
    /// Creates a new `AllowedWorkspaces`.
    ///
    /// - Parameters:
    ///   - actor:
    ///   - dateUpdate:
    ///   - source:
    ///   - teamIds:
    ///   - _type:
    public init(
        actor: Swift.String? = nil,
        dateUpdate: Swift.Int? = nil,
        source: Swift.String? = nil,
        teamIds: [Swift.String]? = nil,
        _type: Swift.String,
    ) {
        self.actor = actor
        self.dateUpdate = dateUpdate
        self.source = source
        self.teamIds = teamIds
        self._type = _type
    }

    public enum CodingKeys: String, CodingKey {
        case actor
        case dateUpdate = "date_update"
        case source
        case teamIds = "team_ids"
        case _type = "type"
    }
}
