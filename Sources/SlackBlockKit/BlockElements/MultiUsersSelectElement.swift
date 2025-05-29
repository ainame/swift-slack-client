import Foundation

public struct MultiUsersSelectElement: Codable, Hashable, Sendable {
    public let type: String
    public let actionId: String?
    public let initialUsers: [String]?
    public let maxSelectedItems: Int?
    public let confirm: ConfirmationDialogObject?
    public let focusOnLoad: Bool?
    public let placeholder: TextObject?

    public init(
        actionId: String? = nil,
        initialUsers: [String]? = nil,
        maxSelectedItems: Int? = nil,
        confirm: ConfirmationDialogObject? = nil,
        focusOnLoad: Bool? = nil,
        placeholder: TextObject? = nil
    ) {
        self.type = "multi_users_select"
        self.actionId = actionId
        self.initialUsers = initialUsers
        self.maxSelectedItems = maxSelectedItems
        self.confirm = confirm
        self.focusOnLoad = focusOnLoad
        self.placeholder = placeholder
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case actionId = "action_id"
        case initialUsers = "initial_users"
        case maxSelectedItems = "max_selected_items"
        case confirm
        case focusOnLoad = "focus_on_load"
        case placeholder
    }
}
