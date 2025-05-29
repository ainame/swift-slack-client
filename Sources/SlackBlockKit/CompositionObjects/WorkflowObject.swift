import Foundation

public struct WorkflowObject: Codable, Hashable, Sendable {
    public let trigger: TriggerObject

    public init(trigger: TriggerObject) {
        self.trigger = trigger
    }
}
