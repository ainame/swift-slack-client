import Foundation

public struct ImageBlock: Codable, Hashable, Sendable {
    public let type: String
    public let altText: String
    public let imageUrl: URL?
    public let slackFile: SlackFileObject?
    public let title: TextObject?
    public let blockId: String?

    public init(
        altText: String,
        imageUrl: URL? = nil,
        slackFile: SlackFileObject? = nil,
        title: TextObject? = nil,
        blockId: String? = nil
    ) {
        type = "image"
        self.altText = altText
        self.imageUrl = imageUrl
        self.slackFile = slackFile
        self.title = title
        self.blockId = blockId
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case altText = "alt_text"
        case imageUrl = "image_url"
        case slackFile = "slack_file"
        case title
        case blockId = "block_id"
    }
}
