import Foundation

public struct MultiConversationsSelectElement: Codable, Hashable, Sendable {
    public let type: String
    public let actionId: String?
    public let initialConversations: [String]?
    public let defaultToCurrentConversation: Bool?
    public let maxSelectedItems: Int?
    public let filter: ConversationFilterObject?
    public let confirm: ConfirmationDialogObject?
    public let focusOnLoad: Bool?
    public let placeholder: TextObject?

    public init(
        actionId: String? = nil,
        initialConversations: [String]? = nil,
        defaultToCurrentConversation: Bool? = nil,
        maxSelectedItems: Int? = nil,
        filter: ConversationFilterObject? = nil,
        confirm: ConfirmationDialogObject? = nil,
        focusOnLoad: Bool? = nil,
        placeholder: TextObject? = nil
    ) {
        self.type = "multi_conversations_select"
        self.actionId = actionId
        self.initialConversations = initialConversations
        self.defaultToCurrentConversation = defaultToCurrentConversation
        self.maxSelectedItems = maxSelectedItems
        self.filter = filter
        self.confirm = confirm
        self.focusOnLoad = focusOnLoad
        self.placeholder = placeholder
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case actionId = "action_id"
        case initialConversations = "initial_conversations"
        case defaultToCurrentConversation = "default_to_current_conversation"
        case maxSelectedItems = "max_selected_items"
        case filter
        case confirm
        case focusOnLoad = "focus_on_load"
        case placeholder
    }
}
