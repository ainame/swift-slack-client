import Foundation

public struct VideoBlock: Codable {
    public let type: String // "video"
    public let altText: String
    public let videoUrl: URL
    public let thumbnailUrl: URL
    public let title: TextObject
    public let titleUrl: URL?
    public let description: TextObject?
    public let providerName: String?
    public let providerIconUrl: URL?
    public let authorName: String?
    public let blockId: String?
    
    public init(
        altText: String,
        videoUrl: URL,
        thumbnailUrl: URL,
        title: TextObject,
        titleUrl: URL? = nil,
        description: TextObject? = nil,
        providerName: String? = nil,
        providerIconUrl: URL? = nil,
        authorName: String? = nil,
        blockId: String? = nil
    ) {
        self.type = "video"
        self.altText = altText
        self.videoUrl = videoUrl
        self.thumbnailUrl = thumbnailUrl
        self.title = title
        self.titleUrl = titleUrl
        self.description = description
        self.providerName = providerName
        self.providerIconUrl = providerIconUrl
        self.authorName = authorName
        self.blockId = blockId
    }
}