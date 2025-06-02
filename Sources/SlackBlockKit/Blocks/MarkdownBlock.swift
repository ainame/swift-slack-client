import Foundation

// A Markdown block containing markdown-formatted text
public struct MarkdownBlock: Codable, Hashable, Sendable {
    public var type: String = "markdown"
    public var text: String
    public var blockId: String?

    public init(text: String, blockId: String? = nil) {
        self.text = text
        self.blockId = blockId
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case text
        case blockId = "block_id"
    }
}
