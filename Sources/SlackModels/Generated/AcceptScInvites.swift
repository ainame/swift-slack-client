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

/// - Remark: Generated from `#/components/schemas/AcceptScInvites`.
public struct AcceptScInvites: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/AcceptScInvites/accept_in_workspace_ids`.
    public var acceptInWorkspaceIds: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/AcceptScInvites/accept_private`.
    public var acceptPrivate: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/AcceptScInvites/actor`.
    public var actor: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AcceptScInvites/date_update`.
    public var dateUpdate: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/AcceptScInvites/invalid_workspace_ids`.
    public var invalidWorkspaceIds: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/AcceptScInvites/source`.
    public var source: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AcceptScInvites/type`.
    public var _type: Swift.String
    /// - Remark: Generated from `#/components/schemas/AcceptScInvites/use_allowed_workspaces`.
    public var useAllowedWorkspaces: Swift.Bool?
    /// Creates a new `AcceptScInvites`.
    ///
    /// - Parameters:
    ///   - acceptInWorkspaceIds:
    ///   - acceptPrivate:
    ///   - actor:
    ///   - dateUpdate:
    ///   - invalidWorkspaceIds:
    ///   - source:
    ///   - _type:
    ///   - useAllowedWorkspaces:
    public init(
        acceptInWorkspaceIds: [Swift.String]? = nil,
        acceptPrivate: Swift.Bool? = nil,
        actor: Swift.String? = nil,
        dateUpdate: Swift.Int? = nil,
        invalidWorkspaceIds: [Swift.String]? = nil,
        source: Swift.String? = nil,
        _type: Swift.String,
        useAllowedWorkspaces: Swift.Bool? = nil
    ) {
        self.acceptInWorkspaceIds = acceptInWorkspaceIds
        self.acceptPrivate = acceptPrivate
        self.actor = actor
        self.dateUpdate = dateUpdate
        self.invalidWorkspaceIds = invalidWorkspaceIds
        self.source = source
        self._type = _type
        self.useAllowedWorkspaces = useAllowedWorkspaces
    }

    public enum CodingKeys: String, CodingKey {
        case acceptInWorkspaceIds = "accept_in_workspace_ids"
        case acceptPrivate = "accept_private"
        case actor
        case dateUpdate = "date_update"
        case invalidWorkspaceIds = "invalid_workspace_ids"
        case source
        case _type = "type"
        case useAllowedWorkspaces = "use_allowed_workspaces"
    }
}
