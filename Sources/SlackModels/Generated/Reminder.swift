@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/Reminder`.
public struct Reminder: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Reminder/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Reminder/creator`.
    public var creator: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Reminder/text`.
    public var text: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Reminder/user`.
    public var user: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Reminder/recurring`.
    public var recurring: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Reminder/time`.
    public var time: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Reminder/channel`.
    public var channel: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Reminder/recurrence`.
    public var recurrence: Recurrence?
    /// - Remark: Generated from `#/components/schemas/Reminder/completeTs`.
    public var completeTs: Swift.Int?
    /// Creates a new `Reminder`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - creator:
    ///   - text:
    ///   - user:
    ///   - recurring:
    ///   - time:
    ///   - channel:
    ///   - recurrence:
    ///   - completeTs:
    public init(
        id: Swift.String? = nil,
        creator: Swift.String? = nil,
        text: Swift.String? = nil,
        user: Swift.String? = nil,
        recurring: Swift.Bool? = nil,
        time: Swift.Int? = nil,
        channel: Swift.String? = nil,
        recurrence: Recurrence? = nil,
        completeTs: Swift.Int? = nil
    ) {
        self.id = id
        self.creator = creator
        self.text = text
        self.user = user
        self.recurring = recurring
        self.time = time
        self.channel = channel
        self.recurrence = recurrence
        self.completeTs = completeTs
    }
}
