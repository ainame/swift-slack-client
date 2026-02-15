import Foundation

public struct UserProfile: Codable, Hashable, Sendable {
    public struct CustomField: Codable, Hashable, Sendable {
        public var value: Swift.String?
        public var alt: Swift.String?
        public var label: Swift.String?

        public init(
            value: Swift.String? = nil,
            alt: Swift.String? = nil,
            label: Swift.String? = nil,
        ) {
            self.value = value
            self.alt = alt
            self.label = label
        }
    }

    public struct StatusEmojiDisplayInfo: Codable, Hashable, Sendable {
        public var emojiName: Swift.String?
        public var displayAlias: Swift.String?
        public var displayUrl: Swift.String?
        public var unicode: Swift.String?

        public init(
            emojiName: Swift.String? = nil,
            displayAlias: Swift.String? = nil,
            displayUrl: Swift.String? = nil,
            unicode: Swift.String? = nil,
        ) {
            self.emojiName = emojiName
            self.displayAlias = displayAlias
            self.displayUrl = displayUrl
            self.unicode = unicode
        }

        private enum CodingKeys: String, CodingKey {
            case emojiName = "emoji_name"
            case displayAlias = "display_alias"
            case displayUrl = "display_url"
            case unicode
        }
    }

    public var name: Swift.String?
    public var team: Swift.String?
    public var title: Swift.String?
    public var phone: Swift.String?
    public var skype: Swift.String?
    public var firstName: Swift.String?
    public var lastName: Swift.String?
    public var realName: Swift.String?
    public var realNameNormalized: Swift.String?
    public var displayName: Swift.String?
    public var displayNameNormalized: Swift.String?
    public var fields: [Swift.String: CustomField]?
    public var statusText: Swift.String?
    public var statusTextCanonical: Swift.String?
    public var statusEmoji: Swift.String?
    public var statusEmojiUrl: Swift.String?
    public var statusEmojiDisplayInfo: [StatusEmojiDisplayInfo]?
    public var statusExpiration: Swift.Int?
    public var isRestricted: Swift.Bool?
    public var isUltraRestricted: Swift.Bool?
    public var alwaysActive: Swift.Bool?
    public var avatarHash: Swift.String?
    public var startDate: Swift.String?
    public var image24: Swift.String?
    public var image32: Swift.String?
    public var image48: Swift.String?
    public var image72: Swift.String?
    public var image192: Swift.String?
    public var image512: Swift.String?
    public var image1024: Swift.String?
    public var imageOriginal: Swift.String?
    public var isCustomImage: Swift.Bool?
    public var email: Swift.String?
    public var pronouns: Swift.String?
    public var huddleState: Swift.String?
    public var huddleStateExpirationTs: Swift.Int?
    public var apiAppId: Swift.String?
    public var botId: Swift.String?
    public var guestInvitedBy: Swift.String?

    public init(
        name: Swift.String? = nil,
        team: Swift.String? = nil,
        title: Swift.String? = nil,
        phone: Swift.String? = nil,
        skype: Swift.String? = nil,
        firstName: Swift.String? = nil,
        lastName: Swift.String? = nil,
        realName: Swift.String? = nil,
        realNameNormalized: Swift.String? = nil,
        displayName: Swift.String? = nil,
        displayNameNormalized: Swift.String? = nil,
        fields: [Swift.String: CustomField]? = nil,
        statusText: Swift.String? = nil,
        statusTextCanonical: Swift.String? = nil,
        statusEmoji: Swift.String? = nil,
        statusEmojiUrl: Swift.String? = nil,
        statusEmojiDisplayInfo: [StatusEmojiDisplayInfo]? = nil,
        statusExpiration: Swift.Int? = nil,
        isRestricted: Swift.Bool? = nil,
        isUltraRestricted: Swift.Bool? = nil,
        alwaysActive: Swift.Bool? = nil,
        avatarHash: Swift.String? = nil,
        startDate: Swift.String? = nil,
        image24: Swift.String? = nil,
        image32: Swift.String? = nil,
        image48: Swift.String? = nil,
        image72: Swift.String? = nil,
        image192: Swift.String? = nil,
        image512: Swift.String? = nil,
        image1024: Swift.String? = nil,
        imageOriginal: Swift.String? = nil,
        isCustomImage: Swift.Bool? = nil,
        email: Swift.String? = nil,
        pronouns: Swift.String? = nil,
        huddleState: Swift.String? = nil,
        huddleStateExpirationTs: Swift.Int? = nil,
        apiAppId: Swift.String? = nil,
        botId: Swift.String? = nil,
        guestInvitedBy: Swift.String? = nil,
    ) {
        self.name = name
        self.team = team
        self.title = title
        self.phone = phone
        self.skype = skype
        self.firstName = firstName
        self.lastName = lastName
        self.realName = realName
        self.realNameNormalized = realNameNormalized
        self.displayName = displayName
        self.displayNameNormalized = displayNameNormalized
        self.fields = fields
        self.statusText = statusText
        self.statusTextCanonical = statusTextCanonical
        self.statusEmoji = statusEmoji
        self.statusEmojiUrl = statusEmojiUrl
        self.statusEmojiDisplayInfo = statusEmojiDisplayInfo
        self.statusExpiration = statusExpiration
        self.isRestricted = isRestricted
        self.isUltraRestricted = isUltraRestricted
        self.alwaysActive = alwaysActive
        self.avatarHash = avatarHash
        self.startDate = startDate
        self.image24 = image24
        self.image32 = image32
        self.image48 = image48
        self.image72 = image72
        self.image192 = image192
        self.image512 = image512
        self.image1024 = image1024
        self.imageOriginal = imageOriginal
        self.isCustomImage = isCustomImage
        self.email = email
        self.pronouns = pronouns
        self.huddleState = huddleState
        self.huddleStateExpirationTs = huddleStateExpirationTs
        self.apiAppId = apiAppId
        self.botId = botId
        self.guestInvitedBy = guestInvitedBy
    }

    private enum CodingKeys: String, CodingKey {
        case name
        case team
        case title
        case phone
        case skype
        case firstName = "first_name"
        case lastName = "last_name"
        case realName = "real_name"
        case realNameNormalized = "real_name_normalized"
        case displayName = "display_name"
        case displayNameNormalized = "display_name_normalized"
        case fields
        case statusText = "status_text"
        case statusTextCanonical = "status_text_canonical"
        case statusEmoji = "status_emoji"
        case statusEmojiUrl = "status_emoji_url"
        case statusEmojiDisplayInfo = "status_emoji_display_info"
        case statusExpiration = "status_expiration"
        case isRestricted = "is_restricted"
        case isUltraRestricted = "is_ultra_restricted"
        case alwaysActive = "always_active"
        case avatarHash = "avatar_hash"
        case startDate = "start_date"
        case image24 = "image_24"
        case image32 = "image_32"
        case image48 = "image_48"
        case image72 = "image_72"
        case image192 = "image_192"
        case image512 = "image_512"
        case image1024 = "image_1024"
        case imageOriginal = "image_original"
        case isCustomImage = "is_custom_image"
        case email
        case pronouns
        case huddleState = "huddle_state"
        case huddleStateExpirationTs = "huddle_state_expiration_ts"
        case apiAppId = "api_app_id"
        case botId = "bot_id"
        case guestInvitedBy = "guest_invited_by"
    }
}
