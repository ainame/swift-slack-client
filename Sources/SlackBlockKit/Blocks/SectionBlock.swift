import Foundation

public struct SectionBlock: Codable {
    public let type: String // "section"
    public let text: TextObject?
    public let fields: [TextObject]?
    public let accessory: SectionAccessoryElement?
    public let blockId: String?
    public let expand: Bool?
    
    public init(
        text: TextObject? = nil,
        fields: [TextObject]? = nil,
        accessory: SectionAccessoryElement? = nil,
        blockId: String? = nil,
        expand: Bool? = nil
    ) {
        self.type = "section"
        self.text = text
        self.fields = fields
        self.accessory = accessory
        self.blockId = blockId
        self.expand = expand
    }
}

// Protocol for elements that can be used as Section block accessories
public protocol SectionAccessoryElement: Codable {
    var type: String { get }
}

// Extend applicable elements to conform to SectionAccessoryElement
extension ButtonElement: SectionAccessoryElement {}
extension CheckboxesElement: SectionAccessoryElement {}
extension DatePickerElement: SectionAccessoryElement {}
extension ImageElement: SectionAccessoryElement {}
extension MultiStaticSelectElement: SectionAccessoryElement {}
extension MultiExternalSelectElement: SectionAccessoryElement {}
extension MultiUsersSelectElement: SectionAccessoryElement {}
extension MultiConversationsSelectElement: SectionAccessoryElement {}
extension MultiChannelsSelectElement: SectionAccessoryElement {}
extension OverflowMenuElement: SectionAccessoryElement {}
extension RadioButtonsElement: SectionAccessoryElement {}
extension StaticSelectElement: SectionAccessoryElement {}
extension ExternalSelectElement: SectionAccessoryElement {}
extension UsersSelectElement: SectionAccessoryElement {}
extension ConversationsSelectElement: SectionAccessoryElement {}
extension ChannelsSelectElement: SectionAccessoryElement {}
extension TimePickerElement: SectionAccessoryElement {}