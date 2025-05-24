import Foundation

public struct ContextBlock: Codable {
    public let type: String // "context"
    public let elements: [ContextElementType]
    public let blockId: String?
    
    public init(elements: [ContextElementType], blockId: String? = nil) {
        self.type = "context"
        self.elements = elements
        self.blockId = blockId
    }
}

public enum ContextElementType: Codable {
    case text(TextObject)
    case image(ImageElement)
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let typeContainer = try decoder.container(keyedBy: CodingKeys.self)
        let type = try typeContainer.decode(String.self, forKey: .type)
        
        switch type {
        case "plain_text", "mrkdwn":
            self = .text(try container.decode(TextObject.self))
        case "image":
            self = .image(try container.decode(ImageElement.self))
        default:
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unknown context element type: \(type)")
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .text(let element):
            try container.encode(element)
        case .image(let element):
            try container.encode(element)
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case type
    }
}

// Protocol for elements that can be used in Context block
public protocol ContextElement: Codable {
    var type: String { get }
}

// Extend applicable elements to conform to ContextElement
extension TextObject: ContextElement {}
extension ImageElement: ContextElement {}