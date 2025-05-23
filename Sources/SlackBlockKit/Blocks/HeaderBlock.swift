import Foundation

public struct HeaderBlock: Codable, Hashable, Sendable {
    public let type: String // "header"
    public let text: TextObject
    public let blockId: String?
    
    public init(text: TextObject, blockId: String? = nil) {
        self.type = "header"
        self.text = text
        self.blockId = blockId
    }
}
