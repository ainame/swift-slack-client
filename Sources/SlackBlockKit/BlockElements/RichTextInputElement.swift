import Foundation

public struct RichTextInputElement: Codable {
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

// Placeholder for Rich Text Object - to be implemented when we get to rich text specs
public struct RichTextObject: Codable {
    // This will be implemented based on rich text specifications
}