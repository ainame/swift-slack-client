@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/Comment`.
public struct Comment: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Comment/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Comment/created`.
    public var created: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Comment/timestamp`.
    public var timestamp: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Comment/user`.
    public var user: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Comment/comment`.
    public var comment: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Comment/channel`.
    public var channel: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Comment/isIntro`.
    public var isIntro: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Comment/numStars`.
    public var numStars: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Comment/isStarred`.
    public var isStarred: Swift.Bool?
    /// Creates a new `Comment`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - created:
    ///   - timestamp:
    ///   - user:
    ///   - comment:
    ///   - channel:
    ///   - isIntro:
    ///   - numStars:
    ///   - isStarred:
    public init(
        id: Swift.String? = nil,
        created: Swift.Int? = nil,
        timestamp: Swift.Int? = nil,
        user: Swift.String? = nil,
        comment: Swift.String? = nil,
        channel: Swift.String? = nil,
        isIntro: Swift.Bool? = nil,
        numStars: Swift.Int? = nil,
        isStarred: Swift.Bool? = nil
    ) {
        self.id = id
        self.created = created
        self.timestamp = timestamp
        self.user = user
        self.comment = comment
        self.channel = channel
        self.isIntro = isIntro
        self.numStars = numStars
        self.isStarred = isStarred
    }
}
