import Foundation

public struct ChannelsSelectElement: Codable, Hashable, Sendable {
    public let type = "channels_select"
    public let actionId: String?
    public let initialChannel: String?
    public let responseUrlEnabled: Bool?
    public let confirm: ConfirmationDialogObject?
    public let focusOnLoad: Bool?
    public let placeholder: TextObject?

    public init(
        actionId: String? = nil,
        initialChannel: String? = nil,
        responseUrlEnabled: Bool? = nil,
        confirm: ConfirmationDialogObject? = nil,
        focusOnLoad: Bool? = nil,
        placeholder: TextObject? = nil
    ) {
        self.actionId = actionId
        self.initialChannel = initialChannel
        self.responseUrlEnabled = responseUrlEnabled
        self.confirm = confirm
        self.focusOnLoad = focusOnLoad
        self.placeholder = placeholder
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case actionId = "action_id"
        case initialChannel = "initial_channel"
        case responseUrlEnabled = "response_url_enabled"
        case confirm
        case focusOnLoad = "focus_on_load"
        case placeholder
    }
}
