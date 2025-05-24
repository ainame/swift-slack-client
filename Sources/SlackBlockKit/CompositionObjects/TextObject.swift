import Foundation

public struct TextObject: Codable, Hashable, Sendable {
    public let type: TextType
    public let text: String
    public let emoji: Bool?
    public let verbatim: Bool?
    
    public init(type: TextType, text: String, emoji: Bool? = nil, verbatim: Bool? = nil) {
        self.type = type
        self.text = text
        self.emoji = emoji
        self.verbatim = verbatim
    }
}

public enum TextType: String, Codable, Hashable, Sendable {
    case plainText = "plain_text"
    case mrkdwn = "mrkdwn"
}
