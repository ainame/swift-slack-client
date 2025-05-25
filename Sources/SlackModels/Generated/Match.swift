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

#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

/// - Remark: Generated from `#/components/schemas/Match`.
public struct Match: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Match/iid`.
    public var iid: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Match/team`.
    public var team: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Match/channel`.
    public var channel: Channel?
    /// - Remark: Generated from `#/components/schemas/Match/type`.
    public var type: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Match/user`.
    public var user: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Match/username`.
    public var username: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Match/ts`.
    public var ts: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Match/text`.
    public var text: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Match/permalink`.
    public var permalink: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Match/previous`.
    public var previous: Previous?
    /// - Remark: Generated from `#/components/schemas/Match/score`.
    public var score: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Match/blocks`.
    public var blocks: [BlockType]?
    /// - Remark: Generated from `#/components/schemas/Match/attachments`.
    public var attachments: [Attachment]?
    /// - Remark: Generated from `#/components/schemas/Match/files`.
    public var files: [FileElement]?
    /// - Remark: Generated from `#/components/schemas/Match/noReactions`.
    public var noReactions: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Match/previous2`.
    public var previous2: Previous?
    /// - Remark: Generated from `#/components/schemas/Match/isMpim`.
    public var isMpim: Swift.Bool?
    /// Creates a new `Match`.
    ///
    /// - Parameters:
    ///   - iid:
    ///   - team:
    ///   - channel:
    ///   - type:
    ///   - user:
    ///   - username:
    ///   - ts:
    ///   - text:
    ///   - permalink:
    ///   - previous:
    ///   - score:
    ///   - blocks:
    ///   - attachments:
    ///   - files:
    ///   - noReactions:
    ///   - previous2:
    ///   - isMpim:
    public init(
        iid: Swift.String? = nil,
        team: Swift.String? = nil,
        channel: Channel? = nil,
        type: Swift.String? = nil,
        user: Swift.String? = nil,
        username: Swift.String? = nil,
        ts: Swift.String? = nil,
        text: Swift.String? = nil,
        permalink: Swift.String? = nil,
        previous: Previous? = nil,
        score: Swift.Int? = nil,
        blocks: [BlockType]? = nil,
        attachments: [Attachment]? = nil,
        files: [FileElement]? = nil,
        noReactions: Swift.Bool? = nil,
        previous2: Previous? = nil,
        isMpim: Swift.Bool? = nil
    ) {
        self.iid = iid
        self.team = team
        self.channel = channel
        self.type = type
        self.user = user
        self.username = username
        self.ts = ts
        self.text = text
        self.permalink = permalink
        self.previous = previous
        self.score = score
        self.blocks = blocks
        self.attachments = attachments
        self.files = files
        self.noReactions = noReactions
        self.previous2 = previous2
        self.isMpim = isMpim
    }
}
