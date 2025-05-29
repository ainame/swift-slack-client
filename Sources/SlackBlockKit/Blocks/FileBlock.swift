import Foundation

public struct FileBlock: Codable, Hashable, Sendable {
    public let type: String // "file"
    public let externalId: String
    public let source: String // "remote"
    public let blockId: String?

    public init(externalId: String, blockId: String? = nil) {
        type = "file"
        self.externalId = externalId
        source = "remote"
        self.blockId = blockId
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case externalId = "external_id"
        case source
        case blockId = "block_id"
    }
}
