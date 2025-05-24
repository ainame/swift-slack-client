import Foundation

public struct UsersSelectElement: Codable, Hashable, Sendable {
    public let type: String // "users_select"
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
        placeholder: TextObject? = nil
    ) {
        self.type = "users_select"
        self.actionId = actionId
        self.initialUser = initialUser
        self.confirm = confirm
        self.focusOnLoad = focusOnLoad
        self.placeholder = placeholder
    }
}
