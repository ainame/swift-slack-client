import Foundation

public struct DatetimePickerElement: Codable, Hashable, Sendable {
    public let type: String
    public let actionId: String?
    public let initialDateTime: Int?
    public let confirm: ConfirmationDialogObject?
    public let focusOnLoad: Bool?

    public init(
        actionId: String? = nil,
        initialDateTime: Int? = nil,
        confirm: ConfirmationDialogObject? = nil,
        focusOnLoad: Bool? = nil,
    ) {
        type = "datetimepicker"
        self.actionId = actionId
        self.initialDateTime = initialDateTime
        self.confirm = confirm
        self.focusOnLoad = focusOnLoad
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case actionId = "action_id"
        case initialDateTime = "initial_date_time"
        case confirm
        case focusOnLoad = "focus_on_load"
    }
}
