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

/// - Remark: Generated from `#/components/schemas/ScMpdmToPrivate`.
public struct ScMpdmToPrivate: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ScMpdmToPrivate/type`.
    public var type: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ScMpdmToPrivate/actor`.
    public var actor: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ScMpdmToPrivate/source`.
    public var source: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ScMpdmToPrivate/acceptInWorkspaceId`.
    public var acceptInWorkspaceId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ScMpdmToPrivate/invalidWorkspaceIds`.
    public var invalidWorkspaceIds: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/ScMpdmToPrivate/dateUpdate`.
    public var dateUpdate: Swift.Int?
    /// Creates a new `ScMpdmToPrivate`.
    ///
    /// - Parameters:
    ///   - type:
    ///   - actor:
    ///   - source:
    ///   - acceptInWorkspaceId:
    ///   - invalidWorkspaceIds:
    ///   - dateUpdate:
    public init(
        type: Swift.String? = nil,
        actor: Swift.String? = nil,
        source: Swift.String? = nil,
        acceptInWorkspaceId: Swift.String? = nil,
        invalidWorkspaceIds: [Swift.String]? = nil,
        dateUpdate: Swift.Int? = nil
    ) {
        self.type = type
        self.actor = actor
        self.source = source
        self.acceptInWorkspaceId = acceptInWorkspaceId
        self.invalidWorkspaceIds = invalidWorkspaceIds
        self.dateUpdate = dateUpdate
    }
}
