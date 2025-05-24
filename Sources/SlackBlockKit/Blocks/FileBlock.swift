import Foundation

public struct FileBlock: Codable, Hashable, Sendable {
    public let type: String // "file"
    public let externalId: String
    public let source: String // "remote"
    public let blockId: String?
    
    public init(externalId: String, blockId: String? = nil) {
        self.type = "file"
        self.externalId = externalId
        self.source = "remote"
        self.blockId = blockId
    }
}
