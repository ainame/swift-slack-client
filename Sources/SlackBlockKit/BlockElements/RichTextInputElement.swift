import Foundation

public struct RichTextInputElement: Codable, Hashable, Sendable {
    public let type: String // "rich_text_input"
    public let actionId: String
    public let initialValue: RichTextObject?
    public let dispatchActionConfig: DispatchActionConfigurationObject?
    public let focusOnLoad: Bool?
    public let placeholder: TextObject?
    
    public init(
        actionId: String,
        initialValue: RichTextObject? = nil,
        dispatchActionConfig: DispatchActionConfigurationObject? = nil,
        focusOnLoad: Bool? = nil,
        placeholder: TextObject? = nil
    ) {
        self.type = "rich_text_input"
        self.actionId = actionId
        self.initialValue = initialValue
        self.dispatchActionConfig = dispatchActionConfig
        self.focusOnLoad = focusOnLoad
        self.placeholder = placeholder
    }
}

// Rich Text Object for input elements - based on rich text specifications
public struct RichTextObject: Codable, Hashable, Sendable {
    public let type: String // "rich_text"
    public let elements: [RichTextElementType]
    
    public init(elements: [RichTextElementType]) {
        self.type = "rich_text"
        self.elements = elements
    }
}
