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
    /// - Remark: Generated from `#/components/schemas/Item/type`.
    public var type: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Item/channel`.
    public var channel: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Item/message`.
    public var message: Message?
    /// - Remark: Generated from `#/components/schemas/Item/file`.
    public var file: ItemFile?
    /// - Remark: Generated from `#/components/schemas/Item/comment`.
    public var comment: Comment?
    /// - Remark: Generated from `#/components/schemas/Item/dateCreate`.
    public var dateCreate: Swift.Int?
    /// Creates a new `Item`.
    ///
    /// - Parameters:
    ///   - type:
    ///   - channel:
    ///   - message:
    ///   - file:
    ///   - comment:
    ///   - dateCreate:
    public init(
        type: Swift.String? = nil,
        channel: Swift.String? = nil,
        message: Message? = nil,
        file: ItemFile? = nil,
        comment: Comment? = nil,
        dateCreate: Swift.Int? = nil
    ) {
        self.type = type
        self.channel = channel
        self.message = message
        self.file = file
        self.comment = comment
        self.dateCreate = dateCreate
    }
}
