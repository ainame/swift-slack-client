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

/// - Remark: Generated from `#/components/schemas/AcceptScInvites`.
public struct AcceptScInvites: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/AcceptScInvites/type`.
    public var type: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AcceptScInvites/actor`.
    public var actor: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AcceptScInvites/source`.
    public var source: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AcceptScInvites/acceptInWorkspaceIds`.
    public var acceptInWorkspaceIds: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/AcceptScInvites/invalidWorkspaceIds`.
    public var invalidWorkspaceIds: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/AcceptScInvites/useAllowedWorkspaces`.
    public var useAllowedWorkspaces: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/AcceptScInvites/acceptPrivate`.
    public var acceptPrivate: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/AcceptScInvites/dateUpdate`.
    public var dateUpdate: Swift.Int?
    /// Creates a new `AcceptScInvites`.
    ///
    /// - Parameters:
    ///   - type:
    ///   - actor:
    ///   - source:
    ///   - acceptInWorkspaceIds:
    ///   - invalidWorkspaceIds:
    ///   - useAllowedWorkspaces:
    ///   - acceptPrivate:
    ///   - dateUpdate:
    public init(
        type: Swift.String? = nil,
        actor: Swift.String? = nil,
        source: Swift.String? = nil,
        acceptInWorkspaceIds: [Swift.String]? = nil,
        invalidWorkspaceIds: [Swift.String]? = nil,
        useAllowedWorkspaces: Swift.Bool? = nil,
        acceptPrivate: Swift.Bool? = nil,
        dateUpdate: Swift.Int? = nil
    ) {
        self.type = type
        self.actor = actor
        self.source = source
        self.acceptInWorkspaceIds = acceptInWorkspaceIds
        self.invalidWorkspaceIds = invalidWorkspaceIds
        self.useAllowedWorkspaces = useAllowedWorkspaces
        self.acceptPrivate = acceptPrivate
        self.dateUpdate = dateUpdate
    }
}
