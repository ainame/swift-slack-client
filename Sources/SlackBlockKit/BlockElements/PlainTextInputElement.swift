import Foundation

public struct PlainTextInputElement: Codable {
    public let type: String // "plain_text_input"
    public let actionId: String?
    public let initialValue: String?
    public let multiline: Bool?
    public let minLength: Int?
    public let maxLength: Int?
    public let dispatchActionConfig: DispatchActionConfigurationObject?
    public let focusOnLoad: Bool?
    public let placeholder: TextObject?
    
    public init(
        actionId: String? = nil,
        initialValue: String? = nil,
        multiline: Bool? = nil,
        minLength: Int? = nil,
        maxLength: Int? = nil,
        dispatchActionConfig: DispatchActionConfigurationObject? = nil,
        focusOnLoad: Bool? = nil,
        placeholder: TextObject? = nil
    ) {
        self.type = "plain_text_input"
        self.actionId = actionId
        self.initialValue = initialValue
        self.multiline = multiline
        self.minLength = minLength
        self.maxLength = maxLength
        self.dispatchActionConfig = dispatchActionConfig
        self.focusOnLoad = focusOnLoad
        self.placeholder = placeholder
    }
}