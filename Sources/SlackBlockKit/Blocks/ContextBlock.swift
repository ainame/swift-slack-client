import Foundation

public struct ContextBlock: Codable, Hashable, Sendable {
    public let type: String
    public let elements: [ContextElementType]
    public let blockId: String?

    public init(elements: [ContextElementType], blockId: String? = nil) {
        type = "context"
        self.elements = elements
        self.blockId = blockId
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case elements
        case blockId = "block_id"
    }
}

public enum ContextElementType: Codable, Hashable, Sendable {
    case text(TextObject)
    case image(ImageElement)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let typeContainer = try decoder.container(keyedBy: CodingKeys.self)
        let type = try typeContainer.decode(String.self, forKey: .type)

        switch type {
        case "plain_text", "mrkdwn":
            self = try .text(container.decode(TextObject.self))
        case "image":
            self = try .image(container.decode(ImageElement.self))
        default:
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unknown context element type: \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case let .text(element):
            try container.encode(element)
        case let .image(element):
            try container.encode(element)
        }
    }

    private enum CodingKeys: String, CodingKey {
        case type
    }
}
