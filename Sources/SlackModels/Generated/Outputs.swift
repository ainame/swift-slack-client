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

/// - Remark: Generated from `#/components/schemas/Outputs`.
public struct Outputs: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Outputs/channel_id`.
    public var channelId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Outputs/message_ts`.
    public var messageTs: Swift.String?
    /// Creates a new `Outputs`.
    ///
    /// - Parameters:
    ///   - channelId:
    ///   - messageTs:
    public init(
        channelId: Swift.String? = nil,
        messageTs: Swift.String? = nil,
    ) {
        self.channelId = channelId
        self.messageTs = messageTs
    }

    public enum CodingKeys: String, CodingKey {
        case channelId = "channel_id"
        case messageTs = "message_ts"
    }
}
