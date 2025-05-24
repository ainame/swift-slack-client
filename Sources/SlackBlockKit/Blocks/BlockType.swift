import Foundation

// Enum for all possible block types that can be used in views
public enum BlockType: Codable, Hashable, Sendable {
    case actions(ActionsBlock)
    case context(ContextBlock)
    case divider(DividerBlock)
    case file(FileBlock)
    case header(HeaderBlock)
    case image(ImageBlock)
    case input(InputBlock)
    case richText(RichTextBlock)
    case section(SectionBlock)
    case video(VideoBlock)
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let typeContainer = try decoder.container(keyedBy: CodingKeys.self)
        let type = try typeContainer.decode(String.self, forKey: .type)
        
        switch type {
        case "actions":
            self = .actions(try container.decode(ActionsBlock.self))
        case "context":
            self = .context(try container.decode(ContextBlock.self))
        case "divider":
            self = .divider(try container.decode(DividerBlock.self))
        case "file":
            self = .file(try container.decode(FileBlock.self))
        case "header":
            self = .header(try container.decode(HeaderBlock.self))
        case "image":
            self = .image(try container.decode(ImageBlock.self))
        case "input":
            self = .input(try container.decode(InputBlock.self))
        case "rich_text":
            self = .richText(try container.decode(RichTextBlock.self))
        case "section":
            self = .section(try container.decode(SectionBlock.self))
        case "video":
            self = .video(try container.decode(VideoBlock.self))
        default:
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unknown block type: \(type)")
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .actions(let block):
            try container.encode(block)
        case .context(let block):
            try container.encode(block)
        case .divider(let block):
            try container.encode(block)
        case .file(let block):
            try container.encode(block)
        case .header(let block):
            try container.encode(block)
        case .image(let block):
            try container.encode(block)
        case .input(let block):
            try container.encode(block)
        case .richText(let block):
            try container.encode(block)
        case .section(let block):
            try container.encode(block)
        case .video(let block):
            try container.encode(block)
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case type
    }
}
