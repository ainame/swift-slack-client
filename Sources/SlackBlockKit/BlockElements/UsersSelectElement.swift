import Foundation

public struct UsersSelectElement: Codable, Hashable, Sendable {
    public let type: String
    public let actionId: String?
    public let initialUser: String?
    public let confirm: ConfirmationDialogObject?
    public let focusOnLoad: Bool?
    public let placeholder: TextObject?

    public init(
        actionId: String? = nil,
        initialUser: String? = nil,
        confirm: ConfirmationDialogObject? = nil,
        focusOnLoad: Bool? = nil,
        placeholder: TextObject? = nil,
    ) {
        type = "users_select"
        self.actionId = actionId
        self.initialUser = initialUser
        self.confirm = confirm
        self.focusOnLoad = focusOnLoad
        self.placeholder = placeholder
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case actionId = "action_id"
        case initialUser = "initial_user"
        case confirm
        case focusOnLoad = "focus_on_load"
        case placeholder
    }
}
