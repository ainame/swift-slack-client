import Foundation

public struct OverflowMenuElement: Codable, Hashable, Sendable {
    public let type: String
    public let actionId: String?
    public let options: [OptionObject]
    public let confirm: ConfirmationDialogObject?

    public init(
        options: [OptionObject],
        actionId: String? = nil,
        confirm: ConfirmationDialogObject? = nil
    ) {
        self.type = "overflow"
        self.options = options
        self.actionId = actionId
        self.confirm = confirm
    }

    private enum CodingKeys: String, CodingKey {
        case type
        case actionId = "action_id"
        case options
        case confirm
    }
}
