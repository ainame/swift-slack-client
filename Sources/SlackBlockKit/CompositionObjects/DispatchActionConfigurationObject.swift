import Foundation

public struct DispatchActionConfigurationObject: Codable, Hashable, Sendable {
    public let triggerActionsOn: [TriggerAction]?

    public init(triggerActionsOn: [TriggerAction]? = nil) {
        self.triggerActionsOn = triggerActionsOn
    }
}

public enum TriggerAction: String, Codable, Hashable, Sendable {
    case onEnterPressed = "on_enter_pressed"
    case onCharacterEntered = "on_character_entered"
}
