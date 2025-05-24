import Foundation

public struct CheckboxesElement: Codable {
    public let type: String = "checkboxes"
    public let actionId: String?
    public let options: [OptionObject]
    public let initialOptions: [OptionObject]?
    public let confirm: ConfirmationDialogObject?
    public let focusOnLoad: Bool?
    
    public init(
        options: [OptionObject],
        actionId: String? = nil,
        initialOptions: [OptionObject]? = nil,
        confirm: ConfirmationDialogObject? = nil,
        focusOnLoad: Bool? = nil
    ) {
        self.options = options
        self.actionId = actionId
        self.initialOptions = initialOptions
        self.confirm = confirm
        self.focusOnLoad = focusOnLoad
    }
}