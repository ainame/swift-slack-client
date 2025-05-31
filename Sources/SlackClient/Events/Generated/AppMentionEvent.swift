#if Events
import Foundation
import SlackModels
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

public struct AppMentionEvent: SlackEvent {
    public var appId: Swift.String?
    public var blocks: [Block]?
    public var botId: Swift.String?
    public var botProfile: SlackModels.BotProfile?
    public var channel: Swift.String?
    public var clientMsgId: Swift.String?
    public var displayAsBot: Swift.Bool?
    public var edited: SlackModels.Edited?
    public var eventTs: Swift.String?
    public var sourceTeam: Swift.String?
    public var subtype: Swift.String?
    public var team: Swift.String?
    public var text: Swift.String?
    public var threadTs: Swift.String?
    public var ts: Swift.String?
    public var _type: Swift.String
    public var upload: Swift.Bool?
    public var user: Swift.String?
    public var userProfile: SlackModels.UserProfile?
    public var userTeam: Swift.String?
    public var username: Swift.String?
    public enum CodingKeys: String, CodingKey {
        case appId = "app_id"
        case blocks
        case botId = "bot_id"
        case botProfile = "bot_profile"
        case channel
        case clientMsgId = "client_msg_id"
        case displayAsBot = "display_as_bot"
        case edited
        case eventTs = "event_ts"
        case sourceTeam = "source_team"
        case subtype
        case team
        case text
        case threadTs = "thread_ts"
        case ts
        case _type = "type"
        case upload
        case user
        case userProfile = "user_profile"
        case userTeam = "user_team"
        case username
    }
}
#endif
