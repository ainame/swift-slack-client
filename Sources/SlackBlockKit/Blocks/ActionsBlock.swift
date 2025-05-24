import Foundation

public struct ActionsBlock: Codable {
    public let type: String // "actions"
    public let elements: [ActionElement]
    public let blockId: String?
    
    public init(elements: [ActionElement], blockId: String? = nil) {
        self.type = "actions"
        self.elements = elements
        self.blockId = blockId
    }
}

// Protocol for elements that can be used in Actions block
public protocol ActionElement: Codable {
    var type: String { get }
}

// Extend BlockElements to conform to ActionElement
extension ButtonElement: ActionElement {}
extension CheckboxesElement: ActionElement {}
extension DatePickerElement: ActionElement {}
extension DatetimePickerElement: ActionElement {}
extension MultiStaticSelectElement: ActionElement {}
extension MultiExternalSelectElement: ActionElement {}
extension MultiUsersSelectElement: ActionElement {}
extension MultiConversationsSelectElement: ActionElement {}
extension MultiChannelsSelectElement: ActionElement {}
extension OverflowMenuElement: ActionElement {}
extension RadioButtonsElement: ActionElement {}
extension RichTextInputElement: ActionElement {}
extension StaticSelectElement: ActionElement {}
extension ExternalSelectElement: ActionElement {}
extension UsersSelectElement: ActionElement {}
extension ConversationsSelectElement: ActionElement {}
extension ChannelsSelectElement: ActionElement {}
extension TimePickerElement: ActionElement {}