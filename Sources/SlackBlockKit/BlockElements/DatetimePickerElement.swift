import Foundation

public struct DatetimePickerElement: Codable, Hashable, Sendable {
    public let type: String // "datetimepicker"
    public let actionId: String?
    public let initialDateTime: Int?
    public let confirm: ConfirmationDialogObject?
    public let focusOnLoad: Bool?
    
    public init(
        actionId: String? = nil,
        initialDateTime: Int? = nil,
        confirm: ConfirmationDialogObject? = nil,
        focusOnLoad: Bool? = nil
    ) {
        self.type = "datetimepicker"
        self.actionId = actionId
        self.initialDateTime = initialDateTime
        self.confirm = confirm
        self.focusOnLoad = focusOnLoad
    }
}
