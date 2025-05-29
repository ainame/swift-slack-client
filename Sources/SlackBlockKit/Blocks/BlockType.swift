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
            self = try .actions(container.decode(ActionsBlock.self))
        case "context":
            self = try .context(container.decode(ContextBlock.self))
        case "divider":
            self = try .divider(container.decode(DividerBlock.self))
        case "file":
            self = try .file(container.decode(FileBlock.self))
        case "header":
            self = try .header(container.decode(HeaderBlock.self))
        case "image":
            self = try .image(container.decode(ImageBlock.self))
        case "input":
            self = try .input(container.decode(InputBlock.self))
        case "rich_text":
            self = try .richText(container.decode(RichTextBlock.self))
        case "section":
            self = try .section(container.decode(SectionBlock.self))
        case "video":
            self = try .video(container.decode(VideoBlock.self))
        default:
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unknown block type: \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case let .actions(block):
            try container.encode(block)
        case let .context(block):
            try container.encode(block)
        case let .divider(block):
            try container.encode(block)
        case let .file(block):
            try container.encode(block)
        case let .header(block):
            try container.encode(block)
        case let .image(block):
            try container.encode(block)
        case let .input(block):
            try container.encode(block)
        case let .richText(block):
            try container.encode(block)
        case let .section(block):
            try container.encode(block)
        case let .video(block):
            try container.encode(block)
        }
    }

    private enum CodingKeys: String, CodingKey {
        case type
    }
}
