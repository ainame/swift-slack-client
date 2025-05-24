import Foundation

public struct EmailInputElement: Codable, Hashable, Sendable {
    public let type: String // "email_text_input"
    public let actionId: String?
    public let initialValue: String?
    public let dispatchActionConfig: DispatchActionConfigurationObject?
    public let focusOnLoad: Bool?
    public let placeholder: TextObject?
    
    public init(
        actionId: String? = nil,
        initialValue: String? = nil,
        dispatchActionConfig: DispatchActionConfigurationObject? = nil,
        focusOnLoad: Bool? = nil,
        placeholder: TextObject? = nil
    ) {
        self.type = "email_text_input"
        self.actionId = actionId
        self.initialValue = initialValue
        self.dispatchActionConfig = dispatchActionConfig
        self.focusOnLoad = focusOnLoad
        self.placeholder = placeholder
    }
}
