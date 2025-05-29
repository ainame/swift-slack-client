import Foundation

public struct ImageElement: Codable, Hashable, Sendable {
    public let type: String
    public let altText: String
    public let imageUrl: URL?
    public let slackFile: SlackFileObject?

    public init(altText: String, imageUrl: URL? = nil, slackFile: SlackFileObject? = nil) {
        type = "image"
        self.altText = altText
        self.imageUrl = imageUrl
        self.slackFile = slackFile
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case altText = "alt_text"
        case imageUrl = "image_url"
        case slackFile = "slack_file"
    }
}
