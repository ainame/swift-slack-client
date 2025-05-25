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

/// - Remark: Generated from `#/components/schemas/ApprovedApp`.
public struct ApprovedApp: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ApprovedApp/app`.
    public var app: App?
    /// - Remark: Generated from `#/components/schemas/ApprovedApp/scopes`.
    public var scopes: [Scope]?
    /// - Remark: Generated from `#/components/schemas/ApprovedApp/dateUpdated`.
    public var dateUpdated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/ApprovedApp/lastResolvedBy`.
    public var lastResolvedBy: LastResolvedBy?
    /// Creates a new `ApprovedApp`.
    ///
    /// - Parameters:
    ///   - app:
    ///   - scopes:
    ///   - dateUpdated:
    ///   - lastResolvedBy:
    public init(
        app: App? = nil,
        scopes: [Scope]? = nil,
        dateUpdated: Swift.Int? = nil,
        lastResolvedBy: LastResolvedBy? = nil
    ) {
        self.app = app
        self.scopes = scopes
        self.dateUpdated = dateUpdated
        self.lastResolvedBy = lastResolvedBy
    }
}
