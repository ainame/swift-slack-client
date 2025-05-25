@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/FailedUserIDS`.
public struct FailedUserIDS: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/FailedUserIDS/U00000000`.
    public var u00000000: Swift.String?
    /// - Remark: Generated from `#/components/schemas/FailedUserIDS/U00000001`.
    public var u00000001: Swift.String?
    /// Creates a new `FailedUserIDS`.
    ///
    /// - Parameters:
    ///   - u00000000:
    ///   - u00000001:
    public init(
        u00000000: Swift.String? = nil,
        u00000001: Swift.String? = nil
    ) {
        self.u00000000 = u00000000
        self.u00000001 = u00000001
    }
}
