import Foundation

public struct WorkflowObject: Codable {
    public let trigger: TriggerObject
    
    public init(trigger: TriggerObject) {
        self.trigger = trigger
    }
}