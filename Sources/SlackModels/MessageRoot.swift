public struct MessageRoot: Codable, Hashable, Sendable {
    public var text: Swift.String?
    public var user: Swift.String?
    public var username: Swift.String?
    public var team: Swift.String?
    public var mrkdwn: Swift.Bool?
    public var type: Swift.String?
    public var subtype: Swift.String?
    public var icons: Icons?
    public var edited: Edited?
    public var subscribed: Swift.Bool?
    public var ts: Swift.String?
    public var room: Room?
    public var parentUserId: Swift.String?
    public var botId: Swift.String?
    public var threadTs: Swift.String?
    public var botProfile: BotProfile?
    public var replyCount: Swift.Int?
    public var replyUsersCount: Swift.Int?
    public var latestReply: Swift.String?
    public var lastRead: Swift.String?
    public var unreadCount: Swift.Int?
    public var noNotifications: Swift.Bool?
    
    private enum CodingKeys: String, CodingKey {
        case text
        case user
        case username
        case team
        case mrkdwn
        case type
        case subtype
        case icons
        case edited
        case subscribed
        case ts
        case room
        case parentUserId = "parent_user_id"
        case botId = "bot_id"
        case threadTs = "thread_ts"
        case botProfile = "bot_profile"
        case replyCount = "reply_count"
        case replyUsersCount = "reply_users_count"
        case latestReply = "latest_reply"
        case lastRead = "last_read"
        case unreadCount = "unread_count"
        case noNotifications = "no_notifications"
    }

    public init(
        text: Swift.String? = nil,
        user: Swift.String? = nil,
        username: Swift.String? = nil,
        team: Swift.String? = nil,
        mrkdwn: Swift.Bool? = nil,
        type: Swift.String? = nil,
        subtype: Swift.String? = nil,
        icons: Icons? = nil,
        edited: Edited? = nil,
        subscribed: Swift.Bool? = nil,
        ts: Swift.String? = nil,
        room: Room? = nil,
        parentUserId: Swift.String? = nil,
        botId: Swift.String? = nil,
        threadTs: Swift.String? = nil,
        botProfile: BotProfile? = nil,
        replyCount: Swift.Int? = nil,
        replyUsersCount: Swift.Int? = nil,
        latestReply: Swift.String? = nil,
        lastRead: Swift.String? = nil,
        unreadCount: Swift.Int? = nil,
        noNotifications: Swift.Bool? = nil
    ) {
        self.text = text
        self.user = user
        self.username = username
        self.team = team
        self.mrkdwn = mrkdwn
        self.type = type
        self.subtype = subtype
        self.icons = icons
        self.edited = edited
        self.subscribed = subscribed
        self.ts = ts
        self.room = room
        self.parentUserId = parentUserId
        self.botId = botId
        self.threadTs = threadTs
        self.botProfile = botProfile
        self.replyCount = replyCount
        self.replyUsersCount = replyUsersCount
        self.latestReply = latestReply
        self.lastRead = lastRead
        self.unreadCount = unreadCount
        self.noNotifications = noNotifications
    }
}
