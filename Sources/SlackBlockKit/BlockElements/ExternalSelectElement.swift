import Foundation

public struct ExternalSelectElement: Codable, Hashable, Sendable {
    public let type: String // "external_select"
    public let actionId: String?
    public let initialOption: OptionObject?
    public let minQueryLength: Int?
    public let confirm: ConfirmationDialogObject?
    public let focusOnLoad: Bool?
    public let placeholder: TextObject?
    
    public init(
        actionId: String? = nil,
        initialOption: OptionObject? = nil,
        minQueryLength: Int? = nil,
        confirm: ConfirmationDialogObject? = nil,
        focusOnLoad: Bool? = nil,
        placeholder: TextObject? = nil
    ) {
        self.type = "external_select"
        self.actionId = actionId
        self.initialOption = initialOption
        self.minQueryLength = minQueryLength
        self.confirm = confirm
        self.focusOnLoad = focusOnLoad
        self.placeholder = placeholder
    }
}
