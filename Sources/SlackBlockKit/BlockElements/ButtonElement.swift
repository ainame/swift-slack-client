import Foundation

public struct ButtonElement: Codable {
    public let type: String = "button"
    public let text: TextObject
    public let actionId: String?
    public let url: URL?
    public let value: String?
    public let style: ButtonStyle?
    public let confirm: ConfirmationDialogObject?
    public let accessibilityLabel: String?
    
    public init(
        text: TextObject,
        actionId: String? = nil,
        url: URL? = nil,
        value: String? = nil,
        style: ButtonStyle? = nil,
        confirm: ConfirmationDialogObject? = nil,
        accessibilityLabel: String? = nil
    ) {
        self.text = text
        self.actionId = actionId
        self.url = url
        self.value = value
        self.style = style
        self.confirm = confirm
        self.accessibilityLabel = accessibilityLabel
    }
}

public enum ButtonStyle: String, Codable {
    case primary = "primary"
    case danger = "danger"
}