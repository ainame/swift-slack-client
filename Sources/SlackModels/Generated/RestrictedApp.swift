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

/// - Remark: Generated from `#/components/schemas/RestrictedApp`.
public struct RestrictedApp: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/RestrictedApp/app`.
    public var app: App?
    /// - Remark: Generated from `#/components/schemas/RestrictedApp/date_updated`.
    public var dateUpdated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/RestrictedApp/last_resolved_by`.
    public var lastResolvedBy: LastResolvedBy?
    /// - Remark: Generated from `#/components/schemas/RestrictedApp/scopes`.
    public var scopes: [Scope]?
    /// Creates a new `RestrictedApp`.
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
}
