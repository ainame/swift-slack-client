import Foundation

public struct InputBlock: Codable, Hashable, Sendable {
    public let type: String // "input"
    public let label: TextObject
    public let element: InputElementType
    public let blockId: String?
    public let dispatchAction: Bool?
    public let hint: TextObject?
    public let optional: Bool?
    
    public init(
        label: TextObject,
        element: InputElementType,
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

public enum InputElementType: Codable, Hashable, Sendable {
    case checkboxes(CheckboxesElement)
    case datePicker(DatePickerElement)
    case datetimePicker(DatetimePickerElement)
    case emailInput(EmailInputElement)
    case fileInput(FileInputElement)
    case multiStaticSelect(MultiStaticSelectElement)
    case multiExternalSelect(MultiExternalSelectElement)
    case multiUsersSelect(MultiUsersSelectElement)
    case multiConversationsSelect(MultiConversationsSelectElement)
    case multiChannelsSelect(MultiChannelsSelectElement)
    case numberInput(NumberInputElement)
    case plainTextInput(PlainTextInputElement)
    case radioButtons(RadioButtonsElement)
    case richTextInput(RichTextInputElement)
    case staticSelect(StaticSelectElement)
    case externalSelect(ExternalSelectElement)
    case usersSelect(UsersSelectElement)
    case conversationsSelect(ConversationsSelectElement)
    case channelsSelect(ChannelsSelectElement)
    case timePicker(TimePickerElement)
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let typeContainer = try decoder.container(keyedBy: CodingKeys.self)
        let type = try typeContainer.decode(String.self, forKey: .type)
        
        switch type {
        case "checkboxes":
            self = .checkboxes(try container.decode(CheckboxesElement.self))
        case "datepicker":
            self = .datePicker(try container.decode(DatePickerElement.self))
        case "datetimepicker":
            self = .datetimePicker(try container.decode(DatetimePickerElement.self))
        case "email_text_input":
            self = .emailInput(try container.decode(EmailInputElement.self))
        case "file_input":
            self = .fileInput(try container.decode(FileInputElement.self))
        case "multi_static_select":
            self = .multiStaticSelect(try container.decode(MultiStaticSelectElement.self))
        case "multi_external_select":
            self = .multiExternalSelect(try container.decode(MultiExternalSelectElement.self))
        case "multi_users_select":
            self = .multiUsersSelect(try container.decode(MultiUsersSelectElement.self))
        case "multi_conversations_select":
            self = .multiConversationsSelect(try container.decode(MultiConversationsSelectElement.self))
        case "multi_channels_select":
            self = .multiChannelsSelect(try container.decode(MultiChannelsSelectElement.self))
        case "number_input":
            self = .numberInput(try container.decode(NumberInputElement.self))
        case "plain_text_input":
            self = .plainTextInput(try container.decode(PlainTextInputElement.self))
        case "radio_buttons":
            self = .radioButtons(try container.decode(RadioButtonsElement.self))
        case "rich_text_input":
            self = .richTextInput(try container.decode(RichTextInputElement.self))
        case "static_select":
            self = .staticSelect(try container.decode(StaticSelectElement.self))
        case "external_select":
            self = .externalSelect(try container.decode(ExternalSelectElement.self))
        case "users_select":
            self = .usersSelect(try container.decode(UsersSelectElement.self))
        case "conversations_select":
            self = .conversationsSelect(try container.decode(ConversationsSelectElement.self))
        case "channels_select":
            self = .channelsSelect(try container.decode(ChannelsSelectElement.self))
        case "timepicker":
            self = .timePicker(try container.decode(TimePickerElement.self))
        default:
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unknown input element type: \(type)")
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .checkboxes(let element):
            try container.encode(element)
        case .datePicker(let element):
            try container.encode(element)
        case .datetimePicker(let element):
            try container.encode(element)
        case .emailInput(let element):
            try container.encode(element)
        case .fileInput(let element):
            try container.encode(element)
        case .multiStaticSelect(let element):
            try container.encode(element)
        case .multiExternalSelect(let element):
            try container.encode(element)
        case .multiUsersSelect(let element):
            try container.encode(element)
        case .multiConversationsSelect(let element):
            try container.encode(element)
        case .multiChannelsSelect(let element):
            try container.encode(element)
        case .numberInput(let element):
            try container.encode(element)
        case .plainTextInput(let element):
            try container.encode(element)
        case .radioButtons(let element):
            try container.encode(element)
        case .richTextInput(let element):
            try container.encode(element)
        case .staticSelect(let element):
            try container.encode(element)
        case .externalSelect(let element):
            try container.encode(element)
        case .usersSelect(let element):
            try container.encode(element)
        case .conversationsSelect(let element):
            try container.encode(element)
        case .channelsSelect(let element):
            try container.encode(element)
        case .timePicker(let element):
            try container.encode(element)
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case type
    }
}

