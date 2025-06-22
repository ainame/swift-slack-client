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
    /// - Remark: Generated from `#/components/schemas/Item/ts`.
    public var ts: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Item/type`.
    public var _type: Swift.String
    /// Creates a new `Item`.
    ///
    /// - Parameters:
    ///   - channel:
    ///   - comment:
    ///   - dateCreate:
    ///   - file:
    ///   - message:
    ///   - ts:
    ///   - _type:
    public init(
        channel: Swift.String? = nil,
        comment: Comment? = nil,
        dateCreate: Swift.Int? = nil,
        file: ItemFile? = nil,
        message: Message? = nil,
        ts: Swift.String? = nil,
        _type: Swift.String
    ) {
        self.channel = channel
        self.comment = comment
        self.dateCreate = dateCreate
        self.file = file
        self.message = message
        self.ts = ts
        self._type = _type
    }

    public enum CodingKeys: String, CodingKey {
        case channel
        case comment
        case dateCreate = "date_create"
        case file
        case message
        case ts
        case _type = "type"
    }
}
