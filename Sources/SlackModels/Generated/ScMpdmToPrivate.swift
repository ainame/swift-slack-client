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
    public var type: Swift.String?
    /// Creates a new `ScMpdmToPrivate`.
    ///
    /// - Parameters:
    ///   - acceptInWorkspaceId:
    ///   - actor:
    ///   - dateUpdate:
    ///   - invalidWorkspaceIds:
    ///   - source:
    ///   - type:
    public init(
        acceptInWorkspaceId: Swift.String? = nil,
        actor: Swift.String? = nil,
        dateUpdate: Swift.Int? = nil,
        invalidWorkspaceIds: [Swift.String]? = nil,
        source: Swift.String? = nil,
        type: Swift.String? = nil
    ) {
        self.acceptInWorkspaceId = acceptInWorkspaceId
        self.actor = actor
        self.dateUpdate = dateUpdate
        self.invalidWorkspaceIds = invalidWorkspaceIds
        self.source = source
        self.type = type
    }
}
