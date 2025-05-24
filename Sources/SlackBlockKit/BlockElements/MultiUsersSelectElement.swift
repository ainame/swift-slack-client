import Foundation

public struct MultiUsersSelectElement: Codable {
    public let type: String // "multi_users_select"
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
}