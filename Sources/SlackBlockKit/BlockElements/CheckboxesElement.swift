import Foundation

public struct CheckboxesElement: Codable, Hashable, Sendable {
    public let type: String // "checkboxes"
    public let actionId: String?
    public let options: [OptionObject]
    public let initialOptions: [OptionObject]?
    public let confirm: ConfirmationDialogObject?
    public let focusOnLoad: Bool?
    
    public init(
        options: [OptionObject],
        actionId: String? = nil,
        initialOptions: [OptionObject]? = nil,
        confirm: ConfirmationDialogObject? = nil,
        focusOnLoad: Bool? = nil
    ) {
        self.type = "checkboxes"
        self.options = options
        self.actionId = actionId
        self.initialOptions = initialOptions
        self.confirm = confirm
        self.focusOnLoad = focusOnLoad
    }
    
    private enum CodingKeys: String, CodingKey {
        case type
        case actionId = "action_id"
        case options
        case initialOptions = "initial_options"
        case confirm
        case focusOnLoad = "focus_on_load"
    }
}
