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

/// - Remark: Generated from `#/components/schemas/ApprovedApp`.
public struct ApprovedApp: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ApprovedApp/app`.
    public var app: App?
    /// - Remark: Generated from `#/components/schemas/ApprovedApp/date_updated`.
    public var dateUpdated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/ApprovedApp/last_resolved_by`.
    public var lastResolvedBy: LastResolvedBy?
    /// - Remark: Generated from `#/components/schemas/ApprovedApp/scopes`.
    public var scopes: [Scope]?
    /// Creates a new `ApprovedApp`.
    ///
    /// - Parameters:
    ///   - app:
    ///   - dateUpdated:
    ///   - lastResolvedBy:
    ///   - scopes:
    public init(
        app: App? = nil,
        dateUpdated: Swift.Int? = nil,
        lastResolvedBy: LastResolvedBy? = nil,
        scopes: [Scope]? = nil
    ) {
        self.app = app
        self.dateUpdated = dateUpdated
        self.lastResolvedBy = lastResolvedBy
        self.scopes = scopes
    }

    public enum CodingKeys: String, CodingKey {
        case app
        case dateUpdated = "date_updated"
        case lastResolvedBy = "last_resolved_by"
        case scopes
    }
}
