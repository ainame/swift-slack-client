import Foundation

public struct HeaderBlock: Codable, Hashable, Sendable {
    public let type = "header"
    public let text: TextObject
    public let blockId: String?

    public init(text: TextObject, blockId: String? = nil) {
        self.text = text
        self.blockId = blockId
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case text
        case blockId = "block_id"
    }
}
