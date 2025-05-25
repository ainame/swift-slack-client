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

/// - Remark: Generated from `#/components/schemas/InitialComment`.
public struct InitialComment: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/InitialComment/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InitialComment/created`.
    public var created: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InitialComment/timestamp`.
    public var timestamp: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InitialComment/user`.
    public var user: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InitialComment/comment`.
    public var comment: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InitialComment/channel`.
    public var channel: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InitialComment/isIntro`.
    public var isIntro: Swift.Bool?
    /// Creates a new `InitialComment`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - created:
    ///   - timestamp:
    ///   - user:
    ///   - comment:
    ///   - channel:
    ///   - isIntro:
    public init(
        id: Swift.String? = nil,
        created: Swift.Int? = nil,
        timestamp: Swift.Int? = nil,
        user: Swift.String? = nil,
        comment: Swift.String? = nil,
        channel: Swift.String? = nil,
        isIntro: Swift.Bool? = nil
    ) {
        self.id = id
        self.created = created
        self.timestamp = timestamp
        self.user = user
        self.comment = comment
        self.channel = channel
        self.isIntro = isIntro
    }
}
