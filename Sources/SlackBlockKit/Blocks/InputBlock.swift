import Foundation

public struct InputBlock: Codable {
    public let type: String // "input"
    public let label: TextObject
    public let element: InputElement
    public let blockId: String?
    public let dispatchAction: Bool?
    public let hint: TextObject?
    public let optional: Bool?
    
    public init(
        label: TextObject,
        element: InputElement,
        blockId: String? = nil,
        dispatchAction: Bool? = nil,
        hint: TextObject? = nil,
        optional: Bool? = nil
    ) {
        self.type = "input"
        self.label = label
        self.element = element
        self.blockId = blockId
        self.dispatchAction = dispatchAction
        self.hint = hint
        self.optional = optional
    }
}

// Protocol for elements that can be used in Input block
public protocol InputElement: Codable {
    var type: String { get }
}

// Extend applicable elements to conform to InputElement
extension CheckboxesElement: InputElement {}
extension DatePickerElement: InputElement {}
extension DatetimePickerElement: InputElement {}
extension EmailInputElement: InputElement {}
extension FileInputElement: InputElement {}
extension MultiStaticSelectElement: InputElement {}
extension MultiExternalSelectElement: InputElement {}
extension MultiUsersSelectElement: InputElement {}
extension MultiConversationsSelectElement: InputElement {}
extension MultiChannelsSelectElement: InputElement {}
extension NumberInputElement: InputElement {}
extension PlainTextInputElement: InputElement {}
extension RadioButtonsElement: InputElement {}
extension RichTextInputElement: InputElement {}
extension StaticSelectElement: InputElement {}
extension ExternalSelectElement: InputElement {}
extension UsersSelectElement: InputElement {}
extension ConversationsSelectElement: InputElement {}
extension ChannelsSelectElement: InputElement {}
extension TimePickerElement: InputElement {}