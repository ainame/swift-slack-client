import Foundation

public struct StaticSelectElement: Codable, Hashable, Sendable {
    public let type = "static_select"
    public let options: [OptionObject]?
    public let optionGroups: [OptionGroupObject]?
    public let actionId: String?
    public let initialOption: OptionObject?
    public let confirm: ConfirmationDialogObject?
    public let focusOnLoad: Bool?
    public let placeholder: TextObject?

    public init(
        options: [OptionObject]? = nil,
        optionGroups: [OptionGroupObject]? = nil,
        actionId: String? = nil,
        initialOption: OptionObject? = nil,
        confirm: ConfirmationDialogObject? = nil,
        focusOnLoad: Bool? = nil,
        placeholder: TextObject? = nil
    ) {
        self.options = options
        self.optionGroups = optionGroups
        self.actionId = actionId
        self.initialOption = initialOption
        self.confirm = confirm
        self.focusOnLoad = focusOnLoad
        self.placeholder = placeholder
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case options
        case optionGroups = "option_groups"
        case actionId = "action_id"
        case initialOption = "initial_option"
        case confirm
        case focusOnLoad = "focus_on_load"
        case placeholder
    }
}
