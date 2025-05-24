import Foundation

public struct ImageElement: Codable, Hashable, Sendable {
    public let type: String // "image"
    public let altText: String
    public let imageUrl: URL?
    public let slackFile: SlackFileObject?
    
    public init(altText: String, imageUrl: URL? = nil, slackFile: SlackFileObject? = nil) {
        self.type = "image"
        self.altText = altText
        self.imageUrl = imageUrl
        self.slackFile = slackFile
    }
}
