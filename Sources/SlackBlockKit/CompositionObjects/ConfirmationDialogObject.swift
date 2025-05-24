import Foundation

public struct ConfirmationDialogObject: Codable {
    public let title: TextObject
    public let text: TextObject
    public let confirm: TextObject
    public let deny: TextObject
    public let style: ConfirmationStyle?
    
    public init(title: TextObject, text: TextObject, confirm: TextObject, deny: TextObject, style: ConfirmationStyle? = nil) {
        self.title = title
        self.text = text
        self.confirm = confirm
        self.deny = deny
        self.style = style
    }
}

public enum ConfirmationStyle: String, Codable {
    case danger = "danger"
    case primary = "primary"
}