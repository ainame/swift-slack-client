import Foundation

public struct Tokens: Codable, Hashable, Sendable {
    public var oauth: [Swift.String]?
    public var bot: [Swift.String]?

    public init(
        oauth: [Swift.String]? = nil,
        bot: [Swift.String]? = nil
    ) {
        self.oauth = oauth
        self.bot = bot
    }
}
