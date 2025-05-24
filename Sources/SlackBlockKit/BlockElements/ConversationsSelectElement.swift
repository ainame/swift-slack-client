import Foundation

public struct ConversationsSelectElement: Codable {
    public let type: String // "conversations_select"
    public let actionId: String?
    public let initialConversation: String?
    public let defaultToCurrentConversation: Bool?
    public let responseUrlEnabled: Bool?
    public let filter: ConversationFilterObject?
    public let confirm: ConfirmationDialogObject?
    public let focusOnLoad: Bool?
    public let placeholder: TextObject?
    
    public init(
        actionId: String? = nil,
        initialConversation: String? = nil,
        defaultToCurrentConversation: Bool? = nil,
        responseUrlEnabled: Bool? = nil,
        filter: ConversationFilterObject? = nil,
        confirm: ConfirmationDialogObject? = nil,
        focusOnLoad: Bool? = nil,
        placeholder: TextObject? = nil
    ) {
        self.type = "conversations_select"
        self.actionId = actionId
        self.initialConversation = initialConversation
        self.defaultToCurrentConversation = defaultToCurrentConversation
        self.responseUrlEnabled = responseUrlEnabled
        self.filter = filter
        self.confirm = confirm
        self.focusOnLoad = focusOnLoad
        self.placeholder = placeholder
    }
}