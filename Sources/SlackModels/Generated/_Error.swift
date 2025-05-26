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
    /// - Remark: Generated from `#/components/schemas/Error/error`.
    public var error: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Error/ok`.
    public var ok: Swift.Bool
    /// - Remark: Generated from `#/components/schemas/Error/user`.
    public var user: Swift.String?
    /// Creates a new `_Error`.
    ///
    /// - Parameters:
    ///   - error:
    ///   - ok:
    ///   - user:
    public init(
        error: Swift.String? = nil,
        ok: Swift.Bool,
        user: Swift.String? = nil
    ) {
        self.error = error
        self.ok = ok
        self.user = user
    }
    public enum CodingKeys: String, CodingKey {
        case error
        case ok
        case user
    }
}
