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

/// - Remark: Generated from `#/components/schemas/Previous`.
public struct Previous: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Previous/attachments`.
    public var attachments: [Attachment]?
    /// - Remark: Generated from `#/components/schemas/Previous/blocks`.
    public var blocks: [BlockType]?
    /// - Remark: Generated from `#/components/schemas/Previous/iid`.
    public var iid: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Previous/permalink`.
    public var permalink: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Previous/text`.
    public var text: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Previous/ts`.
    public var ts: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Previous/type`.
    public var type: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Previous/user`.
    public var user: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Previous/username`.
    public var username: Swift.String?
    /// Creates a new `Previous`.
    ///
    /// - Parameters:
    ///   - attachments:
    ///   - blocks:
    ///   - iid:
    ///   - permalink:
    ///   - text:
    ///   - ts:
    ///   - type:
    ///   - user:
    ///   - username:
    public init(
        attachments: [Attachment]? = nil,
        blocks: [BlockType]? = nil,
        iid: Swift.String? = nil,
        permalink: Swift.String? = nil,
        text: Swift.String? = nil,
        ts: Swift.String? = nil,
        type: Swift.String? = nil,
        user: Swift.String? = nil,
        username: Swift.String? = nil
    ) {
        self.attachments = attachments
        self.blocks = blocks
        self.iid = iid
        self.permalink = permalink
        self.text = text
        self.ts = ts
        self.type = type
        self.user = user
        self.username = username
    }
}
