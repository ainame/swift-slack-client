import Foundation

public struct TimePickerElement: Codable, Hashable, Sendable {
    public let type: String // "timepicker"
    public let actionId: String?
    public let initialTime: String?
    public let confirm: ConfirmationDialogObject?
    public let focusOnLoad: Bool?
    public let placeholder: TextObject?
    
    public init(
        actionId: String? = nil,
        initialTime: String? = nil,
        confirm: ConfirmationDialogObject? = nil,
        focusOnLoad: Bool? = nil,
        placeholder: TextObject? = nil
    ) {
        self.type = "timepicker"
        self.actionId = actionId
        self.initialTime = initialTime
        self.confirm = confirm
        self.focusOnLoad = focusOnLoad
        self.placeholder = placeholder
    }
}
