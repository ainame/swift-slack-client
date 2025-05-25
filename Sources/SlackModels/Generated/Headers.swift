@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/Headers`.
public struct Headers: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Headers/date`.
    public var date: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Headers/inReplyTo`.
    public var inReplyTo: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Headers/replyTo`.
    public var replyTo: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Headers/messageId`.
    public var messageId: Swift.String?
    /// Creates a new `Headers`.
    ///
    /// - Parameters:
    ///   - date:
    ///   - inReplyTo:
    ///   - replyTo:
    ///   - messageId:
    public init(
        date: Swift.String? = nil,
        inReplyTo: Swift.String? = nil,
        replyTo: Swift.String? = nil,
        messageId: Swift.String? = nil
    ) {
        self.date = date
        self.inReplyTo = inReplyTo
        self.replyTo = replyTo
        self.messageId = messageId
    }
}
