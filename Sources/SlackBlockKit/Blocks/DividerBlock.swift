import Foundation

public struct DividerBlock: Codable, Hashable, Sendable {
    public let type: String // "divider"
    public let blockId: String?
    
    public init(blockId: String? = nil) {
        self.type = "divider"
        self.blockId = blockId
    }
}
