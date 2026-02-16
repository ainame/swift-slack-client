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

/// - Remark: Generated from `#/components/schemas/InitialComment`.
public struct InitialComment: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/InitialComment/channel`.
    public var channel: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InitialComment/comment`.
    public var comment: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InitialComment/created`.
    public var created: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InitialComment/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InitialComment/is_intro`.
    public var isIntro: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/InitialComment/timestamp`.
    public var timestamp: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/InitialComment/user`.
    public var user: Swift.String?
    /// Creates a new `InitialComment`.
    ///
    /// - Parameters:
    ///   - channel:
    ///   - comment:
    ///   - created:
    ///   - id:
    ///   - isIntro:
    ///   - timestamp:
    ///   - user:
    public init(
        channel: Swift.String? = nil,
        comment: Swift.String? = nil,
        created: Swift.Int? = nil,
        id: Swift.String? = nil,
        isIntro: Swift.Bool? = nil,
        timestamp: Swift.Int? = nil,
        user: Swift.String? = nil,
    ) {
        self.channel = channel
        self.comment = comment
        self.created = created
        self.id = id
        self.isIntro = isIntro
        self.timestamp = timestamp
        self.user = user
    }

    public enum CodingKeys: String, CodingKey {
        case channel
        case comment
        case created
        case id
        case isIntro = "is_intro"
        case timestamp
        case user
    }
}
