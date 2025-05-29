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

/// - Remark: Generated from `#/components/schemas/ScMpdmToPrivate`.
public struct ScMpdmToPrivate: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ScMpdmToPrivate/accept_in_workspace_id`.
    public var acceptInWorkspaceId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ScMpdmToPrivate/actor`.
    public var actor: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ScMpdmToPrivate/date_update`.
    public var dateUpdate: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/ScMpdmToPrivate/invalid_workspace_ids`.
    public var invalidWorkspaceIds: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/ScMpdmToPrivate/source`.
    public var source: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ScMpdmToPrivate/type`.
    public var _type: Swift.String
    /// Creates a new `ScMpdmToPrivate`.
    ///
    /// - Parameters:
    ///   - acceptInWorkspaceId:
    ///   - actor:
    ///   - dateUpdate:
    ///   - invalidWorkspaceIds:
    ///   - source:
    ///   - _type:
    public init(
        acceptInWorkspaceId: Swift.String? = nil,
        actor: Swift.String? = nil,
        dateUpdate: Swift.Int? = nil,
        invalidWorkspaceIds: [Swift.String]? = nil,
        source: Swift.String? = nil,
        _type: Swift.String
    ) {
        self.acceptInWorkspaceId = acceptInWorkspaceId
        self.actor = actor
        self.dateUpdate = dateUpdate
        self.invalidWorkspaceIds = invalidWorkspaceIds
        self.source = source
        self._type = _type
    }

    public enum CodingKeys: String, CodingKey {
        case acceptInWorkspaceId = "accept_in_workspace_id"
        case actor
        case dateUpdate = "date_update"
        case invalidWorkspaceIds = "invalid_workspace_ids"
        case source
        case _type = "type"
    }
}
