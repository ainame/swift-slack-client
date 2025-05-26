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

/// - Remark: Generated from `#/components/schemas/Edited`.
public struct Edited: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Edited/ts`.
    public var ts: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Edited/user`.
    public var user: Swift.String?
    /// Creates a new `Edited`.
    ///
    /// - Parameters:
    ///   - ts:
    ///   - user:
    public init(
        ts: Swift.String? = nil,
        user: Swift.String? = nil
    ) {
        self.ts = ts
        self.user = user
    }
    public enum CodingKeys: String, CodingKey {
        case ts
        case user
    }
}
