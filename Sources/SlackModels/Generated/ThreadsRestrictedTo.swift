@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/ThreadsRestrictedTo`.
public struct ThreadsRestrictedTo: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ThreadsRestrictedTo/type`.
    public var type: [Swift.String]?
    /// Creates a new `ThreadsRestrictedTo`.
    ///
    /// - Parameters:
    ///   - type:
    public init(type: [Swift.String]? = nil) {
        self.type = type
    }
}
