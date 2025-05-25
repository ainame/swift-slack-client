@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/NotAdded`.
public struct NotAdded: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/NotAdded/errors`.
    public var errors: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/NotAdded/channelId`.
    public var channelId: Swift.String?
    /// Creates a new `NotAdded`.
    ///
    /// - Parameters:
    ///   - errors:
    ///   - channelId:
    public init(
        errors: [Swift.String]? = nil,
        channelId: Swift.String? = nil
    ) {
        self.errors = errors
        self.channelId = channelId
    }
}
