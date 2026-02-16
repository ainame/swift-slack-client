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

/// - Remark: Generated from `#/components/schemas/Headers`.
public struct Headers: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Headers/date`.
    public var date: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Headers/in_reply_to`.
    public var inReplyTo: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Headers/message_id`.
    public var messageId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Headers/reply_to`.
    public var replyTo: Swift.String?
    /// Creates a new `Headers`.
    ///
    /// - Parameters:
    ///   - date:
    ///   - inReplyTo:
    ///   - messageId:
    ///   - replyTo:
    public init(
        date: Swift.String? = nil,
        inReplyTo: Swift.String? = nil,
        messageId: Swift.String? = nil,
        replyTo: Swift.String? = nil,
    ) {
        self.date = date
        self.inReplyTo = inReplyTo
        self.messageId = messageId
        self.replyTo = replyTo
    }

    public enum CodingKeys: String, CodingKey {
        case date
        case inReplyTo = "in_reply_to"
        case messageId = "message_id"
        case replyTo = "reply_to"
    }
}
