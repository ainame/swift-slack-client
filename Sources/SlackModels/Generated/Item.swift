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

/// - Remark: Generated from `#/components/schemas/Item`.
public struct Item: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Item/channel`.
    public var channel: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Item/comment`.
    public var comment: Comment?
    /// - Remark: Generated from `#/components/schemas/Item/date_create`.
    public var dateCreate: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Item/file`.
    public var file: ItemFile?
    /// - Remark: Generated from `#/components/schemas/Item/message`.
    public var message: Message?
    /// - Remark: Generated from `#/components/schemas/Item/type`.
    public var type: Swift.String?
    /// Creates a new `Item`.
    ///
    /// - Parameters:
    ///   - channel:
    ///   - comment:
    ///   - dateCreate:
    ///   - file:
    ///   - message:
    ///   - type:
    public init(
        channel: Swift.String? = nil,
        comment: Comment? = nil,
        dateCreate: Swift.Int? = nil,
        file: ItemFile? = nil,
        message: Message? = nil,
        type: Swift.String? = nil
    ) {
        self.channel = channel
        self.comment = comment
        self.dateCreate = dateCreate
        self.file = file
        self.message = message
        self.type = type
    }
}
