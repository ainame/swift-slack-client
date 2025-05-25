@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

/// - Remark: Generated from `#/components/schemas/Message`.
public struct Message: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Message/type`.
    public var type: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/text`.
    public var text: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/user`.
    public var user: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/ts`.
    public var ts: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/team`.
    public var team: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/attachments`.
    public var attachments: [Attachment]?
    /// - Remark: Generated from `#/components/schemas/Message/permalink`.
    public var permalink: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/subtype`.
    public var subtype: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/username`.
    public var username: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/blocks`.
    public var blocks: [BlockType]?
    /// - Remark: Generated from `#/components/schemas/Message/subscribed`.
    public var subscribed: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Message/reactions`.
    public var reactions: [Reaction]?
    /// - Remark: Generated from `#/components/schemas/Message/edited`.
    public var edited: Edited?
    /// - Remark: Generated from `#/components/schemas/Message/files`.
    public var files: [FileElement]?
    /// - Remark: Generated from `#/components/schemas/Message/upload`.
    public var upload: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Message/inviter`.
    public var inviter: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/botId`.
    public var botId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/isStarred`.
    public var isStarred: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Message/clientMsgId`.
    public var clientMsgId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/threadTs`.
    public var threadTs: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/replyCount`.
    public var replyCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Message/replyUsersCount`.
    public var replyUsersCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Message/latestReply`.
    public var latestReply: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/replyUsers`.
    public var replyUsers: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Message/lastRead`.
    public var lastRead: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/botProfile`.
    public var botProfile: BotProfile?
    /// - Remark: Generated from `#/components/schemas/Message/displayAsBot`.
    public var displayAsBot: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Message/isLocked`.
    public var isLocked: Swift.Bool?
    /// Creates a new `Message`.
    ///
    /// - Parameters:
    ///   - type:
    ///   - text:
    ///   - user:
    ///   - ts:
    ///   - team:
    ///   - attachments:
    ///   - permalink:
    ///   - subtype:
    ///   - username:
    ///   - blocks:
    ///   - subscribed:
    ///   - reactions:
    ///   - edited:
    ///   - files:
    ///   - upload:
    ///   - inviter:
    ///   - botId:
    ///   - isStarred:
    ///   - clientMsgId:
    ///   - threadTs:
    ///   - replyCount:
    ///   - replyUsersCount:
    ///   - latestReply:
    ///   - replyUsers:
    ///   - lastRead:
    ///   - botProfile:
    ///   - displayAsBot:
    ///   - isLocked:
    public init(
        type: Swift.String? = nil,
        text: Swift.String? = nil,
        user: Swift.String? = nil,
        ts: Swift.String? = nil,
        team: Swift.String? = nil,
        attachments: [Attachment]? = nil,
        permalink: Swift.String? = nil,
        subtype: Swift.String? = nil,
        username: Swift.String? = nil,
        blocks: [BlockType]? = nil,
        subscribed: Swift.Bool? = nil,
        reactions: [Reaction]? = nil,
        edited: Edited? = nil,
        files: [FileElement]? = nil,
        upload: Swift.Bool? = nil,
        inviter: Swift.String? = nil,
        botId: Swift.String? = nil,
        isStarred: Swift.Bool? = nil,
        clientMsgId: Swift.String? = nil,
        threadTs: Swift.String? = nil,
        replyCount: Swift.Int? = nil,
        replyUsersCount: Swift.Int? = nil,
        latestReply: Swift.String? = nil,
        replyUsers: [Swift.String]? = nil,
        lastRead: Swift.String? = nil,
        botProfile: BotProfile? = nil,
        displayAsBot: Swift.Bool? = nil,
        isLocked: Swift.Bool? = nil
    ) {
        self.type = type
        self.text = text
        self.user = user
        self.ts = ts
        self.team = team
        self.attachments = attachments
        self.permalink = permalink
        self.subtype = subtype
        self.username = username
        self.blocks = blocks
        self.subscribed = subscribed
        self.reactions = reactions
        self.edited = edited
        self.files = files
        self.upload = upload
        self.inviter = inviter
        self.botId = botId
        self.isStarred = isStarred
        self.clientMsgId = clientMsgId
        self.threadTs = threadTs
        self.replyCount = replyCount
        self.replyUsersCount = replyUsersCount
        self.latestReply = latestReply
        self.replyUsers = replyUsers
        self.lastRead = lastRead
        self.botProfile = botProfile
        self.displayAsBot = displayAsBot
        self.isLocked = isLocked
    }
}
