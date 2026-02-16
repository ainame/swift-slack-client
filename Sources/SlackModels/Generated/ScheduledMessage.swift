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

/// - Remark: Generated from `#/components/schemas/ScheduledMessage`.
public struct ScheduledMessage: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ScheduledMessage/channel_id`.
    public var channelId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ScheduledMessage/date_created`.
    public var dateCreated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/ScheduledMessage/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ScheduledMessage/post_at`.
    public var postAt: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/ScheduledMessage/text`.
    public var text: Swift.String?
    /// Creates a new `ScheduledMessage`.
    ///
    /// - Parameters:
    ///   - channelId:
    ///   - dateCreated:
    ///   - id:
    ///   - postAt:
    ///   - text:
    public init(
        channelId: Swift.String? = nil,
        dateCreated: Swift.Int? = nil,
        id: Swift.String? = nil,
        postAt: Swift.Int? = nil,
        text: Swift.String? = nil
    ) {
        self.channelId = channelId
        self.dateCreated = dateCreated
        self.id = id
        self.postAt = postAt
        self.text = text
    }
    public enum CodingKeys: String, CodingKey {
        case channelId = "channel_id"
        case dateCreated = "date_created"
        case id
        case postAt = "post_at"
        case text
    }
}
