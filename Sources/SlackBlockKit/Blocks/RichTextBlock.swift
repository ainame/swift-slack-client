import Foundation

public struct RichTextBlock: Codable {
    public let type: String // "rich_text"
    public let elements: [RichTextElement]
    public let blockId: String?
    
    public init(elements: [RichTextElement], blockId: String? = nil) {
        self.type = "rich_text"
        self.elements = elements
        self.blockId = blockId
    }
}

// Protocol for rich text elements
public protocol RichTextElement: Codable {
    var type: String { get }
}

// Placeholder rich text element implementations
// These would be expanded based on rich text specifications
public struct RichTextSection: RichTextElement {
    public let type: String // "rich_text_section"
    // Additional properties would be added based on specifications
    
    public init() {
        self.type = "rich_text_section"
    }
}

public struct RichTextList: RichTextElement {
    public let type: String // "rich_text_list"
    // Additional properties would be added based on specifications
    
    public init() {
        self.type = "rich_text_list"
    }
}

public struct RichTextPreformatted: RichTextElement {
    public let type: String // "rich_text_preformatted"
    // Additional properties would be added based on specifications
    
    public init() {
        self.type = "rich_text_preformatted"
    }
}

public struct RichTextQuote: RichTextElement {
    public let type: String // "rich_text_quote"
    // Additional properties would be added based on specifications
    
    public init() {
        self.type = "rich_text_quote"
    }
}