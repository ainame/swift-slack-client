import Foundation

public struct HomeTabView: Codable, Hashable, Sendable {
    public let type: String
    public let blocks: [Block]
    public let privateMetadata: String?
    public let callbackId: String?
    public let externalId: String?

    public init(
        blocks: [Block],
        privateMetadata: String? = nil,
        callbackId: String? = nil,
        externalId: String? = nil
    ) {
        type = "home"
        self.blocks = blocks
        self.privateMetadata = privateMetadata
        self.callbackId = callbackId
        self.externalId = externalId
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case blocks
        case privateMetadata = "private_metadata"
        case callbackId = "callback_id"
        case externalId = "external_id"
    }
}
