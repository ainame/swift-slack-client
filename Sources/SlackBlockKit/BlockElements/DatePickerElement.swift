import Foundation

public struct DatePickerElement: Codable, Hashable, Sendable {
    public let type: String // "datepicker"
    public let actionId: String?
    public let initialDate: String?
    public let confirm: ConfirmationDialogObject?
    public let focusOnLoad: Bool?
    public let placeholder: TextObject?
    
    public init(
        actionId: String? = nil,
        initialDate: String? = nil,
        confirm: ConfirmationDialogObject? = nil,
        focusOnLoad: Bool? = nil,
        placeholder: TextObject? = nil
    ) {
        self.type = "datepicker"
        self.actionId = actionId
        self.initialDate = initialDate
        self.confirm = confirm
        self.focusOnLoad = focusOnLoad
        self.placeholder = placeholder
    }
}
