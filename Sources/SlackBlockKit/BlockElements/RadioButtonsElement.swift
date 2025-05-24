import Foundation

public struct RadioButtonsElement: Codable {
    public let type: String // "radio_buttons"
    public let options: [OptionObject]
    public let actionId: String?
    public let initialOption: OptionObject?
    public let confirm: ConfirmationDialogObject?
    public let focusOnLoad: Bool?
    
    public init(
        options: [OptionObject],
        actionId: String? = nil,
        initialOption: OptionObject? = nil,
        confirm: ConfirmationDialogObject? = nil,
        focusOnLoad: Bool? = nil
    ) {
        self.type = "radio_buttons"
        self.options = options
        self.actionId = actionId
        self.initialOption = initialOption
        self.confirm = confirm
        self.focusOnLoad = focusOnLoad
    }
}