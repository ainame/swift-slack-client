import Foundation

public struct MultiExternalSelectElement: Codable, Hashable, Sendable {
    public let type: String
    public let actionId: String?
    public let minQueryLength: Int?
    public let initialOptions: [OptionObject]?
    public let maxSelectedItems: Int?
    public let confirm: ConfirmationDialogObject?
    public let focusOnLoad: Bool?
    public let placeholder: TextObject?

    public init(
        actionId: String? = nil,
        minQueryLength: Int? = nil,
        initialOptions: [OptionObject]? = nil,
        maxSelectedItems: Int? = nil,
        confirm: ConfirmationDialogObject? = nil,
        focusOnLoad: Bool? = nil,
        placeholder: TextObject? = nil
    ) {
        self.type = "multi_external_select"
        self.actionId = actionId
        self.minQueryLength = minQueryLength
        self.initialOptions = initialOptions
        self.maxSelectedItems = maxSelectedItems
        self.confirm = confirm
        self.focusOnLoad = focusOnLoad
        self.placeholder = placeholder
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case actionId = "action_id"
        case minQueryLength = "min_query_length"
        case initialOptions = "initial_options"
        case maxSelectedItems = "max_selected_items"
        case confirm
        case focusOnLoad = "focus_on_load"
        case placeholder
    }
}
