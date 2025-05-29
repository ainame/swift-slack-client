import Foundation

public struct SectionBlock: Codable, Hashable, Sendable {
    public let type = "section"
    public let text: TextObject?
    public let fields: [TextObject]?
    public let accessory: SectionAccessory?
    public let blockId: String?
    public let expand: Bool?

    public init(
        text: TextObject? = nil,
        fields: [TextObject]? = nil,
        accessory: SectionAccessory? = nil,
        blockId: String? = nil,
        expand: Bool? = nil
    ) {
        self.text = text
        self.fields = fields
        self.accessory = accessory
        self.blockId = blockId
        self.expand = expand
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case text
        case fields
        case accessory
        case blockId = "block_id"
        case expand
    }
}

public enum SectionAccessory: Codable, Hashable, Sendable {
    case button(ButtonElement)
    case checkboxes(CheckboxesElement)
    case datePicker(DatePickerElement)
    case image(ImageElement)
    case multiStaticSelect(MultiStaticSelectElement)
    case multiExternalSelect(MultiExternalSelectElement)
    case multiUsersSelect(MultiUsersSelectElement)
    case multiConversationsSelect(MultiConversationsSelectElement)
    case multiChannelsSelect(MultiChannelsSelectElement)
    case overflow(OverflowMenuElement)
    case radioButtons(RadioButtonsElement)
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
        case "button":
            self = try .button(container.decode(ButtonElement.self))
        case "checkboxes":
            self = try .checkboxes(container.decode(CheckboxesElement.self))
        case "datepicker":
            self = try .datePicker(container.decode(DatePickerElement.self))
        case "image":
            self = try .image(container.decode(ImageElement.self))
        case "multi_static_select":
            self = try .multiStaticSelect(container.decode(MultiStaticSelectElement.self))
        case "multi_external_select":
            self = try .multiExternalSelect(container.decode(MultiExternalSelectElement.self))
        case "multi_users_select":
            self = try .multiUsersSelect(container.decode(MultiUsersSelectElement.self))
        case "multi_conversations_select":
            self = try .multiConversationsSelect(container.decode(MultiConversationsSelectElement.self))
        case "multi_channels_select":
            self = try .multiChannelsSelect(container.decode(MultiChannelsSelectElement.self))
        case "overflow":
            self = try .overflow(container.decode(OverflowMenuElement.self))
        case "radio_buttons":
            self = try .radioButtons(container.decode(RadioButtonsElement.self))
        case "static_select":
            self = try .staticSelect(container.decode(StaticSelectElement.self))
        case "external_select":
            self = try .externalSelect(container.decode(ExternalSelectElement.self))
        case "users_select":
            self = try .usersSelect(container.decode(UsersSelectElement.self))
        case "conversations_select":
            self = try .conversationsSelect(container.decode(ConversationsSelectElement.self))
        case "channels_select":
            self = try .channelsSelect(container.decode(ChannelsSelectElement.self))
        case "timepicker":
            self = try .timePicker(container.decode(TimePickerElement.self))
        default:
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Unknown section accessory type: \(type)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()

        switch self {
        case let .button(element):
            try container.encode(element)
        case let .checkboxes(element):
            try container.encode(element)
        case let .datePicker(element):
            try container.encode(element)
        case let .image(element):
            try container.encode(element)
        case let .multiStaticSelect(element):
            try container.encode(element)
        case let .multiExternalSelect(element):
            try container.encode(element)
        case let .multiUsersSelect(element):
            try container.encode(element)
        case let .multiConversationsSelect(element):
            try container.encode(element)
        case let .multiChannelsSelect(element):
            try container.encode(element)
        case let .overflow(element):
            try container.encode(element)
        case let .radioButtons(element):
            try container.encode(element)
        case let .staticSelect(element):
            try container.encode(element)
        case let .externalSelect(element):
            try container.encode(element)
        case let .usersSelect(element):
            try container.encode(element)
        case let .conversationsSelect(element):
            try container.encode(element)
        case let .channelsSelect(element):
            try container.encode(element)
        case let .timePicker(element):
            try container.encode(element)
        }
    }

    private enum CodingKeys: String, CodingKey {
        case type
    }
}
