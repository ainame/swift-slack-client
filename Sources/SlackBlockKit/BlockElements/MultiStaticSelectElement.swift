import Foundation

public struct MultiStaticSelectElement: Codable, Hashable, Sendable {
    public let type = "multi_static_select"
    public let actionId: String?
    public let options: [OptionObject]
    public let initialOptions: [OptionObject]?
    public let maxSelectedItems: Int?
    public let confirm: ConfirmationDialogObject?
    public let focusOnLoad: Bool?
    public let placeholder: TextObject?

    public init(
        options: [OptionObject],
        actionId: String? = nil,
        initialOptions: [OptionObject]? = nil,
        maxSelectedItems: Int? = nil,
        confirm: ConfirmationDialogObject? = nil,
        focusOnLoad: Bool? = nil,
        placeholder: TextObject? = nil
    ) {
        self.options = options
        self.actionId = actionId
        self.initialOptions = initialOptions
        self.maxSelectedItems = maxSelectedItems
        self.confirm = confirm
        self.focusOnLoad = focusOnLoad
        self.placeholder = placeholder
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case actionId = "action_id"
        case options
        case initialOptions = "initial_options"
        case maxSelectedItems = "max_selected_items"
        case confirm
        case focusOnLoad = "focus_on_load"
        case placeholder
    }
}
