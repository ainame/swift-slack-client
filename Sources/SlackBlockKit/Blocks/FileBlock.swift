import Foundation

public struct FileBlock: Codable, Hashable, Sendable {
    public let type = "file"
    public let externalId: String
    public let source = "remote"
    public let blockId: String?

    public init(externalId: String, blockId: String? = nil) {
        self.externalId = externalId
        self.blockId = blockId
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case externalId = "external_id"
        case source
        case blockId = "block_id"
    }
}
