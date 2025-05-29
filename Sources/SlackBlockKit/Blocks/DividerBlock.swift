import Foundation

public struct DividerBlock: Codable, Hashable, Sendable {
    public let type: String
    public let blockId: String?

    public init(blockId: String? = nil) {
        self.type = "divider"
        self.blockId = blockId
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case blockId = "block_id"
    }
}
