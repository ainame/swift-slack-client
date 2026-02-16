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

/// - Remark: Generated from `#/components/schemas/Comment`.
public struct Comment: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Comment/channel`.
    public var channel: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Comment/comment`.
    public var comment: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Comment/created`.
    public var created: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Comment/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Comment/is_intro`.
    public var isIntro: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Comment/is_starred`.
    public var isStarred: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Comment/num_stars`.
    public var numStars: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Comment/timestamp`.
    public var timestamp: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Comment/user`.
    public var user: Swift.String?
    /// Creates a new `Comment`.
    ///
    /// - Parameters:
    ///   - channel:
    ///   - comment:
    ///   - created:
    ///   - id:
    ///   - isIntro:
    ///   - isStarred:
    ///   - numStars:
    ///   - timestamp:
    ///   - user:
    public init(
        channel: Swift.String? = nil,
        comment: Swift.String? = nil,
        created: Swift.Int? = nil,
        id: Swift.String? = nil,
        isIntro: Swift.Bool? = nil,
        isStarred: Swift.Bool? = nil,
        numStars: Swift.Int? = nil,
        timestamp: Swift.Int? = nil,
        user: Swift.String? = nil
    ) {
        self.channel = channel
        self.comment = comment
        self.created = created
        self.id = id
        self.isIntro = isIntro
        self.isStarred = isStarred
        self.numStars = numStars
        self.timestamp = timestamp
        self.user = user
    }
    public enum CodingKeys: String, CodingKey {
        case channel
        case comment
        case created
        case id
        case isIntro = "is_intro"
        case isStarred = "is_starred"
        case numStars = "num_stars"
        case timestamp
        case user
    }
}
