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

/// - Remark: Generated from `#/components/schemas/Posts`.
public struct Posts: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Posts/matches`.
    public var matches: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Posts/total`.
    public var total: Swift.Int?
    /// Creates a new `Posts`.
    ///
    /// - Parameters:
    ///   - matches:
    ///   - total:
    public init(
        matches: [Swift.String]? = nil,
        total: Swift.Int? = nil
    ) {
        self.matches = matches
        self.total = total
    }
    public enum CodingKeys: String, CodingKey {
        case matches
        case total
    }
}
