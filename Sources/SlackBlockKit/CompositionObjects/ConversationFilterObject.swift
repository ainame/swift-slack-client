import Foundation

public struct ConversationFilterObject: Codable, Hashable, Sendable {
    public let include: [ConversationType]?
    public let excludeExternalSharedChannels: Bool?
    public let excludeBotUsers: Bool?
    
    public init(include: [ConversationType]? = nil, excludeExternalSharedChannels: Bool? = nil, excludeBotUsers: Bool? = nil) {
        self.include = include
        self.excludeExternalSharedChannels = excludeExternalSharedChannels
        self.excludeBotUsers = excludeBotUsers
    }
}

public enum ConversationType: String, Codable, Hashable, Sendable {
    case im = "im"
    case mpim = "mpim"
    case `private` = "private"
    case `public` = "public"
}
