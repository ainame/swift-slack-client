import Foundation
import OpenAPIRuntime

public struct StateValuesObject: Codable, Hashable, Sendable {
    /// This should be [String: StateValuesObject.Value]? but Codable can't decode dictionary.
    /// OpenAPIObjectContainer can support such case.
    public let values: OpenAPIObjectContainer?

    /// Helper subscript to access nested values by block_id and action_id
    public subscript(blockId: String) -> [String: Value]? {
        guard let values,
              let blockValue = values.value[blockId] as? [String: Any],
              let blockData = try? JSONSerialization.data(withJSONObject: blockValue),
              let blockContainer = try? JSONDecoder().decode([String: Value].self, from: blockData) else {
            return nil
        }
        return blockContainer
    }

    public subscript(blockId: String, actionId: String) -> Value? {
        self[blockId]?[actionId]
    }

    public struct Value: Codable, Hashable, Sendable {
        public let type: String
        public let value: String?
        public let selectedDate: String?
        public let selectedTime: String?
        public let selectedUser: String?
        public let selectedConversation: String?
        public let selectedChannel: String?
        public let selectedOption: SelectedOption?
        public let selectedConversations: [String]?
        public let selectedChannels: [String]?
        public let selectedUsers: [String]?
        public let selectedOptions: [SelectedOption]?

        private enum CodingKeys: String, CodingKey {
            case type
            case value
            case selectedDate = "selected_date"
            case selectedTime = "selected_time"
            case selectedUser = "selected_user"
            case selectedConversation = "selected_conversation"
            case selectedChannel = "selected_channel"
            case selectedOption = "selected_option"
            case selectedConversations = "selected_conversations"
            case selectedChannels = "selected_channels"
            case selectedUsers = "selected_users"
            case selectedOptions = "selected_options"
        }
    }

    public struct SelectedOption: Codable, Hashable, Sendable {
        public let text: TextObject
        public let value: String
    }
}
