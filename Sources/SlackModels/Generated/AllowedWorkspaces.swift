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

/// - Remark: Generated from `#/components/schemas/AllowedWorkspaces`.
public struct AllowedWorkspaces: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/AllowedWorkspaces/type`.
    public var type: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AllowedWorkspaces/actor`.
    public var actor: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AllowedWorkspaces/source`.
    public var source: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AllowedWorkspaces/teamIds`.
    public var teamIds: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/AllowedWorkspaces/dateUpdate`.
    public var dateUpdate: Swift.Int?
    /// Creates a new `AllowedWorkspaces`.
    ///
    /// - Parameters:
    ///   - type:
    ///   - actor:
    ///   - source:
    ///   - teamIds:
    ///   - dateUpdate:
    public init(
        type: Swift.String? = nil,
        actor: Swift.String? = nil,
        source: Swift.String? = nil,
        teamIds: [Swift.String]? = nil,
        dateUpdate: Swift.Int? = nil
    ) {
        self.type = type
        self.actor = actor
        self.source = source
        self.teamIds = teamIds
        self.dateUpdate = dateUpdate
    }
}
