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
    /// - Remark: Generated from `#/components/schemas/ScheduledMessage/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ScheduledMessage/text`.
    public var text: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ScheduledMessage/channelId`.
    public var channelId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ScheduledMessage/postAt`.
    public var postAt: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/ScheduledMessage/dateCreated`.
    public var dateCreated: Swift.Int?
    /// Creates a new `ScheduledMessage`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - text:
    ///   - channelId:
    ///   - postAt:
    ///   - dateCreated:
    public init(
        id: Swift.String? = nil,
        text: Swift.String? = nil,
        channelId: Swift.String? = nil,
        postAt: Swift.Int? = nil,
        dateCreated: Swift.Int? = nil
    ) {
        self.id = id
        self.text = text
        self.channelId = channelId
        self.postAt = postAt
        self.dateCreated = dateCreated
    }
}
