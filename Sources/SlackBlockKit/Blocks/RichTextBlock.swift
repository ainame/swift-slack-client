import Foundation

public struct RichTextBlock: Codable, Hashable, Sendable {
    public let type = "rich_text"
    public let elements: [RichTextElementType]
    public let blockId: String?

    public init(elements: [RichTextElementType], blockId: String? = nil) {
        self.elements = elements
        self.blockId = blockId
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case elements
        case blockId = "block_id"
    }
}

public enum RichTextElementType: Codable, Hashable, Sendable {
    case section(RichTextSection)
    case list(RichTextList)
    case preformatted(RichTextPreformatted)
    case quote(RichTextQuote)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let typeContainer = try decoder.container(keyedBy: CodingKeys.self)
        let type = try typeContainer.decode(String.self, forKey: .type)

        switch type {
        case "rich_text_section":
            self = try .section(container.decode(RichTextSection.self))
        case "rich_text_list":
            self = try .list(container.decode(RichTextList.self))
        case "rich_text_preformatted":
            self = try .preformatted(container.decode(RichTextPreformatted.self))
        case "rich_text_quote":
            self = try .quote(container.decode(RichTextQuote.self))
        default:
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unknown rich text element type: \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case let .section(element):
            try container.encode(element)
        case let .list(element):
            try container.encode(element)
        case let .preformatted(element):
            try container.encode(element)
        case let .quote(element):
            try container.encode(element)
        }
    }

    private enum CodingKeys: String, CodingKey {
        case type
    }
}

// Rich text element implementations based on Slack API specifications
public struct RichTextSection: Codable, Hashable, Sendable {
    public let type = "rich_text_section"
    public let elements: [RichTextContentElement]

    public init(elements: [RichTextContentElement]) {
        self.elements = elements
    }
}

public struct RichTextList: Codable, Hashable, Sendable {
    public let type = "rich_text_list"
    public let style: RichTextListStyle
    public let elements: [RichTextSection]
    public let indent: Int?
    public let offset: Int?
    public let border: Int?

    public init(
        style: RichTextListStyle,
        elements: [RichTextSection],
        indent: Int? = nil,
        offset: Int? = nil,
        border: Int? = nil
    ) {
        self.style = style
        self.elements = elements
        self.indent = indent
        self.offset = offset
        self.border = border
    }
}

public struct RichTextPreformatted: Codable, Hashable, Sendable {
    public let type = "rich_text_preformatted"
    public let elements: [RichTextContentElement]
    public let border: Int?

    public init(elements: [RichTextContentElement], border: Int? = nil) {
        self.elements = elements
        self.border = border
    }
}

public struct RichTextQuote: Codable, Hashable, Sendable {
    public let type = "rich_text_quote"
    public let elements: [RichTextContentElement]
    public let border: Int?

    public init(elements: [RichTextContentElement], border: Int? = nil) {
        self.elements = elements
        self.border = border
    }
}

public enum RichTextListStyle: String, Codable, Hashable, Sendable {
    case bullet
    case ordered
}

public enum RichTextContentElement: Codable, Hashable, Sendable {
    case text(RichTextTextElement)
    case link(RichTextLinkElement)
    case emoji(RichTextEmojiElement)
    case user(RichTextUserElement)
    case channel(RichTextChannelElement)
    case date(RichTextDateElement)
    case broadcast(RichTextBroadcastElement)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let typeContainer = try decoder.container(keyedBy: CodingKeys.self)
        let type = try typeContainer.decode(String.self, forKey: .type)

        switch type {
        case "text":
            self = try .text(container.decode(RichTextTextElement.self))
        case "link":
            self = try .link(container.decode(RichTextLinkElement.self))
        case "emoji":
            self = try .emoji(container.decode(RichTextEmojiElement.self))
        case "user":
            self = try .user(container.decode(RichTextUserElement.self))
        case "channel":
            self = try .channel(container.decode(RichTextChannelElement.self))
        case "date":
            self = try .date(container.decode(RichTextDateElement.self))
        case "broadcast":
            self = try .broadcast(container.decode(RichTextBroadcastElement.self))
        default:
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unknown rich text content element type: \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case let .text(element):
            try container.encode(element)
        case let .link(element):
            try container.encode(element)
        case let .emoji(element):
            try container.encode(element)
        case let .user(element):
            try container.encode(element)
        case let .channel(element):
            try container.encode(element)
        case let .date(element):
            try container.encode(element)
        case let .broadcast(element):
            try container.encode(element)
        }
    }

    private enum CodingKeys: String, CodingKey {
        case type
    }
}

// Rich text content elements
public struct RichTextTextElement: Codable, Hashable, Sendable {
    public let type = "text"
    public let text: String
    public let style: RichTextTextStyle?

    public init(text: String, style: RichTextTextStyle? = nil) {
        self.text = text
        self.style = style
    }
}

public struct RichTextTextStyle: Codable, Hashable, Sendable {
    public let bold: Bool?
    public let italic: Bool?
    public let strike: Bool?
    public let code: Bool?

    public init(bold: Bool? = nil, italic: Bool? = nil, strike: Bool? = nil, code: Bool? = nil) {
        self.bold = bold
        self.italic = italic
        self.strike = strike
        self.code = code
    }
}

public struct RichTextLinkElement: Codable, Hashable, Sendable {
    public let type = "link"
    public let url: String
    public let text: String?
    public let unsafe: Bool?
    public let style: RichTextTextStyle?

    public init(url: String, text: String? = nil, unsafe: Bool? = nil, style: RichTextTextStyle? = nil) {
        self.url = url
        self.text = text
        self.unsafe = unsafe
        self.style = style
    }
}

public struct RichTextEmojiElement: Codable, Hashable, Sendable {
    public let type = "emoji"
    public let name: String
    public let unicode: String?

    public init(name: String, unicode: String? = nil) {
        self.name = name
        self.unicode = unicode
    }
}

public struct RichTextUserElement: Codable, Hashable, Sendable {
    public let type = "user"
    public let userId: String
    public let style: RichTextUserStyle?

    public init(userId: String, style: RichTextUserStyle? = nil) {
        self.userId = userId
        self.style = style
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case userId = "user_id"
        case style
    }
}

public struct RichTextUserStyle: Codable, Hashable, Sendable {
    public let bold: Bool?
    public let italic: Bool?
    public let strike: Bool?
    public let highlight: Bool?
    public let clientHighlight: Bool?
    public let unlink: Bool?

    public init(
        bold: Bool? = nil,
        italic: Bool? = nil,
        strike: Bool? = nil,
        highlight: Bool? = nil,
        clientHighlight: Bool? = nil,
        unlink: Bool? = nil
    ) {
        self.bold = bold
        self.italic = italic
        self.strike = strike
        self.highlight = highlight
        self.clientHighlight = clientHighlight
        self.unlink = unlink
    }

    private enum CodingKeys: String, CodingKey {
        case bold
        case italic
        case strike
        case highlight
        case clientHighlight = "client_highlight"
        case unlink
    }
}

public struct RichTextChannelElement: Codable, Hashable, Sendable {
    public let type = "channel"
    public let channelId: String
    public let style: RichTextUserStyle?

    public init(channelId: String, style: RichTextUserStyle? = nil) {
        self.channelId = channelId
        self.style = style
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case channelId = "channel_id"
        case style
    }
}

public struct RichTextDateElement: Codable, Hashable, Sendable {
    public let type = "date"
    public let timestamp: Int
    public let format: String
    public let url: String?
    public let fallback: String?

    public init(timestamp: Int, format: String, url: String? = nil, fallback: String? = nil) {
        self.timestamp = timestamp
        self.format = format
        self.url = url
        self.fallback = fallback
    }
}

public struct RichTextBroadcastElement: Codable, Hashable, Sendable {
    public let type = "broadcast"
    public let range: String

    public init(range: String) {
        self.range = range
    }
}
