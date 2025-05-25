#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#endif
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit

/// - Remark: Generated from `#/components/schemas/Item`.
public struct Item: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Item/type`.
    public var type: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Item/channel`.
    public var channel: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Item/message`.
    public var message: SlackModels.Message?
    /// - Remark: Generated from `#/components/schemas/Item/file`.
    public var file: SlackModels.ItemFile?
    /// - Remark: Generated from `#/components/schemas/Item/comment`.
    public var comment: SlackModels.Comment?
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
        message: SlackModels.Message? = nil,
        file: SlackModels.ItemFile? = nil,
        comment: SlackModels.Comment? = nil,
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
