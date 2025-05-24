import Foundation

public struct NumberInputElement: Codable {
    public let type: String // "number_input"
    public let isDecimalAllowed: Bool
    public let actionId: String?
    public let initialValue: String?
    public let minValue: String?
    public let maxValue: String?
    public let dispatchActionConfig: DispatchActionConfigurationObject?
    public let focusOnLoad: Bool?
    public let placeholder: TextObject?
    
    public init(
        isDecimalAllowed: Bool,
        actionId: String? = nil,
        initialValue: String? = nil,
        minValue: String? = nil,
        maxValue: String? = nil,
        dispatchActionConfig: DispatchActionConfigurationObject? = nil,
        focusOnLoad: Bool? = nil,
        placeholder: TextObject? = nil
    ) {
        self.type = "number_input"
        self.isDecimalAllowed = isDecimalAllowed
        self.actionId = actionId
        self.initialValue = initialValue
        self.minValue = minValue
        self.maxValue = maxValue
        self.dispatchActionConfig = dispatchActionConfig
        self.focusOnLoad = focusOnLoad
        self.placeholder = placeholder
    }
}