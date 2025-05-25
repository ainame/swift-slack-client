@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/RestrictedApp`.
public struct RestrictedApp: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/RestrictedApp/app`.
    public var app: App?
    /// - Remark: Generated from `#/components/schemas/RestrictedApp/scopes`.
    public var scopes: [Scope]?
    /// - Remark: Generated from `#/components/schemas/RestrictedApp/dateUpdated`.
    public var dateUpdated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/RestrictedApp/lastResolvedBy`.
    public var lastResolvedBy: LastResolvedBy?
    /// Creates a new `RestrictedApp`.
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
