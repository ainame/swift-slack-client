import Foundation

public struct StaticSelectElement: Codable {
    public let type: String // "static_select"
    public let options: [OptionObject]?
    public let optionGroups: [OptionGroupObject]?
    public let actionId: String?
    public let initialOption: OptionObject?
    public let confirm: ConfirmationDialogObject?
    public let focusOnLoad: Bool?
    public let placeholder: TextObject?
    
    public init(
        options: [OptionObject]? = nil,
        optionGroups: [OptionGroupObject]? = nil,
        actionId: String? = nil,
        initialOption: OptionObject? = nil,
        confirm: ConfirmationDialogObject? = nil,
        focusOnLoad: Bool? = nil,
        placeholder: TextObject? = nil
    ) {
        self.type = "static_select"
        self.options = options
        self.optionGroups = optionGroups
        self.actionId = actionId
        self.initialOption = initialOption
        self.confirm = confirm
        self.focusOnLoad = focusOnLoad
        self.placeholder = placeholder
    }
}