import Foundation

public struct MultiChannelsSelectElement: Codable, Hashable, Sendable {
    public let type: String
    public let actionId: String?
    public let initialChannels: [String]?
    public let maxSelectedItems: Int?
    public let confirm: ConfirmationDialogObject?
    public let focusOnLoad: Bool?
    public let placeholder: TextObject?

    public init(
        actionId: String? = nil,
        initialChannels: [String]? = nil,
        maxSelectedItems: Int? = nil,
        confirm: ConfirmationDialogObject? = nil,
        focusOnLoad: Bool? = nil,
        placeholder: TextObject? = nil,
    ) {
        type = "multi_channels_select"
        self.actionId = actionId
        self.initialChannels = initialChannels
        self.maxSelectedItems = maxSelectedItems
        self.confirm = confirm
        self.focusOnLoad = focusOnLoad
        self.placeholder = placeholder
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case actionId = "action_id"
        case initialChannels = "initial_channels"
        case maxSelectedItems = "max_selected_items"
        case confirm
        case focusOnLoad = "focus_on_load"
        case placeholder
    }
}
