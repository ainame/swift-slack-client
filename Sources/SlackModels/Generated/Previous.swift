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
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

/// - Remark: Generated from `#/components/schemas/Previous`.
public struct Previous: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Previous/type`.
    public var type: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Previous/user`.
    public var user: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Previous/username`.
    public var username: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Previous/ts`.
    public var ts: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Previous/text`.
    public var text: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Previous/iid`.
    public var iid: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Previous/permalink`.
    public var permalink: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Previous/attachments`.
    public var attachments: [SlackModels.Attachment]?
    /// - Remark: Generated from `#/components/schemas/Previous/blocks`.
    public var blocks: [SlackBlockKit.BlockType]?
    /// Creates a new `Previous`.
    ///
    /// - Parameters:
    ///   - type:
    ///   - user:
    ///   - username:
    ///   - ts:
    ///   - text:
    ///   - iid:
    ///   - permalink:
    ///   - attachments:
    ///   - blocks:
    public init(
        type: Swift.String? = nil,
        user: Swift.String? = nil,
        username: Swift.String? = nil,
        ts: Swift.String? = nil,
        text: Swift.String? = nil,
        iid: Swift.String? = nil,
        permalink: Swift.String? = nil,
        attachments: [SlackModels.Attachment]? = nil,
        blocks: [SlackBlockKit.BlockType]? = nil
    ) {
        self.type = type
        self.user = user
        self.username = username
        self.ts = ts
        self.text = text
        self.iid = iid
        self.permalink = permalink
        self.attachments = attachments
        self.blocks = blocks
    }
}
