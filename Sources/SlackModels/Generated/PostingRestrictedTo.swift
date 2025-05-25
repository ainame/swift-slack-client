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

/// - Remark: Generated from `#/components/schemas/PostingRestrictedTo`.
public struct PostingRestrictedTo: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/PostingRestrictedTo/type`.
    public var type: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/PostingRestrictedTo/user`.
    public var user: [Swift.String]?
    /// Creates a new `PostingRestrictedTo`.
    ///
    /// - Parameters:
    ///   - type:
    ///   - user:
    public init(
        type: [Swift.String]? = nil,
        user: [Swift.String]? = nil
    ) {
        self.type = type
        self.user = user
    }
}
