import Foundation

public struct HomeTabView: Codable {
    public let type: String // "home"
    public let blocks: [BlockType]
    public let privateMetadata: String?
    public let callbackId: String?
    public let externalId: String?
    
    public init(
        blocks: [BlockType],
        privateMetadata: String? = nil,
        callbackId: String? = nil,
        externalId: String? = nil
    ) {
        self.type = "home"
        self.blocks = blocks
        self.privateMetadata = privateMetadata
        self.callbackId = callbackId
        self.externalId = externalId
    }
}