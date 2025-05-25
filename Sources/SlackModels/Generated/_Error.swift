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

/// - Remark: Generated from `#/components/schemas/Error`.
public struct _Error: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Error/ok`.
    public var ok: Swift.Bool
    /// - Remark: Generated from `#/components/schemas/Error/error`.
    public var error: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Error/user`.
    public var user: Swift.String?
    /// Creates a new `_Error`.
    ///
    /// - Parameters:
    ///   - ok:
    ///   - error:
    ///   - user:
    public init(
        ok: Swift.Bool,
        error: Swift.String? = nil,
        user: Swift.String? = nil
    ) {
        self.ok = ok
        self.error = error
        self.user = user
    }
}
