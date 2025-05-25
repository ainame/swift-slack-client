#if Events
import Foundation
import SlackModels
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

public struct AppMentionEvent: SlackEvent {
    public var type: Swift.String?
    public var user: Swift.String?
    public var username: Swift.String?
    public var subtype: Swift.String?
    public var text: Swift.String?
    public var blocks: [BlockType]?
    public var upload: Swift.Bool?
    public var ts: Swift.String?
    public var team: Swift.String?
    public var channel: Swift.String?
    public var edited: SlackModels.Edited?
    public var clientMsgId: Swift.String?
    public var appId: Swift.String?
    public var botId: Swift.String?
    public var botProfile: SlackModels.BotProfile?
    public var displayAsBot: Swift.Bool?
    public var userTeam: Swift.String?
    public var sourceTeam: Swift.String?
    public var userProfile: SlackModels.UserProfile?
    public var eventTs: Swift.String?
    public var threadTs: Swift.String?
}
#endif
