import Foundation

public struct DispatchActionConfigurationObject: Codable {
    public let triggerActionsOn: [TriggerAction]?
    
    public init(triggerActionsOn: [TriggerAction]? = nil) {
        self.triggerActionsOn = triggerActionsOn
    }
}

public enum TriggerAction: String, Codable {
    case onEnterPressed = "on_enter_pressed"
    case onCharacterEntered = "on_character_entered"
}