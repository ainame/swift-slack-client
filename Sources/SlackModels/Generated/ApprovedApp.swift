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

/// - Remark: Generated from `#/components/schemas/ApprovedApp`.
public struct ApprovedApp: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ApprovedApp/app`.
    public var app: SlackModels.App?
    /// - Remark: Generated from `#/components/schemas/ApprovedApp/scopes`.
    public var scopes: [SlackModels.Scope]?
    /// - Remark: Generated from `#/components/schemas/ApprovedApp/dateUpdated`.
    public var dateUpdated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/ApprovedApp/lastResolvedBy`.
    public var lastResolvedBy: SlackModels.LastResolvedBy?
    /// Creates a new `ApprovedApp`.
    ///
    /// - Parameters:
    ///   - app:
    ///   - scopes:
    ///   - dateUpdated:
    ///   - lastResolvedBy:
    public init(
        app: SlackModels.App? = nil,
        scopes: [SlackModels.Scope]? = nil,
        dateUpdated: Swift.Int? = nil,
        lastResolvedBy: SlackModels.LastResolvedBy? = nil
    ) {
        self.app = app
        self.scopes = scopes
        self.dateUpdated = dateUpdated
        self.lastResolvedBy = lastResolvedBy
    }
}
