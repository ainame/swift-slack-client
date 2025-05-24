import Foundation

public struct ChannelsSelectElement: Codable {
    public let type: String // "channels_select"
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
        self.type = "channels_select"
        self.actionId = actionId
        self.initialChannel = initialChannel
        self.responseUrlEnabled = responseUrlEnabled
        self.confirm = confirm
        self.focusOnLoad = focusOnLoad
        self.placeholder = placeholder
    }
}