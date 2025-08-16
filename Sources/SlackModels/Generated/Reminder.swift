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

/// - Remark: Generated from `#/components/schemas/Reminder`.
public struct Reminder: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Reminder/channel`.
    public var channel: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Reminder/complete_ts`.
    public var completeTs: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Reminder/creator`.
    public var creator: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Reminder/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Reminder/recurrence`.
    public var recurrence: Recurrence?
    /// - Remark: Generated from `#/components/schemas/Reminder/recurring`.
    public var recurring: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Reminder/text`.
    public var text: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Reminder/time`.
    public var time: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Reminder/user`.
    public var user: Swift.String?
    /// Creates a new `Reminder`.
    ///
    /// - Parameters:
    ///   - channel:
    ///   - completeTs:
    ///   - creator:
    ///   - id:
    ///   - recurrence:
    ///   - recurring:
    ///   - text:
    ///   - time:
    ///   - user:
    public init(
        channel: Swift.String? = nil,
        completeTs: Swift.Int? = nil,
        creator: Swift.String? = nil,
        id: Swift.String? = nil,
        recurrence: Recurrence? = nil,
        recurring: Swift.Bool? = nil,
        text: Swift.String? = nil,
        time: Swift.Int? = nil,
        user: Swift.String? = nil,
    ) {
        self.channel = channel
        self.completeTs = completeTs
        self.creator = creator
        self.id = id
        self.recurrence = recurrence
        self.recurring = recurring
        self.text = text
        self.time = time
        self.user = user
    }

    public enum CodingKeys: String, CodingKey {
        case channel
        case completeTs = "complete_ts"
        case creator
        case id
        case recurrence
        case recurring
        case text
        case time
        case user
    }
}
