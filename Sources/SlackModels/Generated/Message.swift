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

/// - Remark: Generated from `#/components/schemas/Message`.
public struct Message: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Message/attachments`.
    public var attachments: [Attachment]?
    /// - Remark: Generated from `#/components/schemas/Message/blocks`.
    public var blocks: [Block]?
    /// - Remark: Generated from `#/components/schemas/Message/bot_id`.
    public var botId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/bot_profile`.
    public var botProfile: BotProfile?
    /// - Remark: Generated from `#/components/schemas/Message/client_msg_id`.
    public var clientMsgId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/display_as_bot`.
    public var displayAsBot: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Message/edited`.
    public var edited: Edited?
    /// - Remark: Generated from `#/components/schemas/Message/files`.
    public var files: [FileElement]?
    /// - Remark: Generated from `#/components/schemas/Message/inviter`.
    public var inviter: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/is_locked`.
    public var isLocked: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Message/is_starred`.
    public var isStarred: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Message/last_read`.
    public var lastRead: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/latest_reply`.
    public var latestReply: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/permalink`.
    public var permalink: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/reactions`.
    public var reactions: [Reaction]?
    /// - Remark: Generated from `#/components/schemas/Message/reply_count`.
    public var replyCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Message/reply_users`.
    public var replyUsers: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Message/reply_users_count`.
    public var replyUsersCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Message/subscribed`.
    public var subscribed: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Message/subtype`.
    public var subtype: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/team`.
    public var team: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/text`.
    public var text: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/thread_ts`.
    public var threadTs: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/ts`.
    public var ts: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/type`.
    public var _type: Swift.String
    /// - Remark: Generated from `#/components/schemas/Message/upload`.
    public var upload: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Message/user`.
    public var user: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Message/username`.
    public var username: Swift.String?
    /// Creates a new `Message`.
    ///
    /// - Parameters:
    ///   - attachments:
    ///   - blocks:
    ///   - botId:
    ///   - botProfile:
    ///   - clientMsgId:
    ///   - displayAsBot:
    ///   - edited:
    ///   - files:
    ///   - inviter:
    ///   - isLocked:
    ///   - isStarred:
    ///   - lastRead:
    ///   - latestReply:
    ///   - permalink:
    ///   - reactions:
    ///   - replyCount:
    ///   - replyUsers:
    ///   - replyUsersCount:
    ///   - subscribed:
    ///   - subtype:
    ///   - team:
    ///   - text:
    ///   - threadTs:
    ///   - ts:
    ///   - _type:
    ///   - upload:
    ///   - user:
    ///   - username:
    public init(
        attachments: [Attachment]? = nil,
        blocks: [Block]? = nil,
        botId: Swift.String? = nil,
        botProfile: BotProfile? = nil,
        clientMsgId: Swift.String? = nil,
        displayAsBot: Swift.Bool? = nil,
        edited: Edited? = nil,
        files: [FileElement]? = nil,
        inviter: Swift.String? = nil,
        isLocked: Swift.Bool? = nil,
        isStarred: Swift.Bool? = nil,
        lastRead: Swift.String? = nil,
        latestReply: Swift.String? = nil,
        permalink: Swift.String? = nil,
        reactions: [Reaction]? = nil,
        replyCount: Swift.Int? = nil,
        replyUsers: [Swift.String]? = nil,
        replyUsersCount: Swift.Int? = nil,
        subscribed: Swift.Bool? = nil,
        subtype: Swift.String? = nil,
        team: Swift.String? = nil,
        text: Swift.String? = nil,
        threadTs: Swift.String? = nil,
        ts: Swift.String? = nil,
        _type: Swift.String,
        upload: Swift.Bool? = nil,
        user: Swift.String? = nil,
        username: Swift.String? = nil
    ) {
        self.attachments = attachments
        self.blocks = blocks
        self.botId = botId
        self.botProfile = botProfile
        self.clientMsgId = clientMsgId
        self.displayAsBot = displayAsBot
        self.edited = edited
        self.files = files
        self.inviter = inviter
        self.isLocked = isLocked
        self.isStarred = isStarred
        self.lastRead = lastRead
        self.latestReply = latestReply
        self.permalink = permalink
        self.reactions = reactions
        self.replyCount = replyCount
        self.replyUsers = replyUsers
        self.replyUsersCount = replyUsersCount
        self.subscribed = subscribed
        self.subtype = subtype
        self.team = team
        self.text = text
        self.threadTs = threadTs
        self.ts = ts
        self._type = _type
        self.upload = upload
        self.user = user
        self.username = username
    }
    public enum CodingKeys: String, CodingKey {
        case attachments
        case blocks
        case botId = "bot_id"
        case botProfile = "bot_profile"
        case clientMsgId = "client_msg_id"
        case displayAsBot = "display_as_bot"
        case edited
        case files
        case inviter
        case isLocked = "is_locked"
        case isStarred = "is_starred"
        case lastRead = "last_read"
        case latestReply = "latest_reply"
        case permalink
        case reactions
        case replyCount = "reply_count"
        case replyUsers = "reply_users"
        case replyUsersCount = "reply_users_count"
        case subscribed
        case subtype
        case team
        case text
        case threadTs = "thread_ts"
        case ts
        case _type = "type"
        case upload
        case user
        case username
    }
}
