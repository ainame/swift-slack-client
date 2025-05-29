@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
@preconcurrency import struct Foundation.Data
@preconcurrency import struct Foundation.Date
@preconcurrency import struct Foundation.URL
#else
import struct Foundation.Data
import struct Foundation.Date
import struct Foundation.URL
#endif

/// - Remark: Generated from `#/components/schemas/NotAdded`.
public struct NotAdded: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/NotAdded/channel_id`.
    public var channelId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/NotAdded/errors`.
    public var errors: [Swift.String]?
    /// Creates a new `NotAdded`.
    ///
    /// - Parameters:
    ///   - channelId:
    ///   - errors:
    public init(
        channelId: Swift.String? = nil,
        errors: [Swift.String]? = nil
    ) {
        self.channelId = channelId
        self.errors = errors
    }

    public enum CodingKeys: String, CodingKey {
        case channelId = "channel_id"
        case errors
    }
}
