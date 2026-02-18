import Foundation

public struct Container: Codable, Hashable, Sendable {
    public let _type: String
    public let viewId: String?
    public let messageTs: String?
    public let channelId: String?
    public let isEphemeral: Bool?

    public init(viewId: String) {
        self._type = "view"
        self.viewId = viewId
        self.messageTs = nil
        self.channelId = nil
        self.isEphemeral = nil
    }

    public init(messageTs: String, channelId: String, isEphemeral: Bool = false) {
        self._type = "message"
        self.viewId = nil
        self.messageTs = messageTs
        self.channelId = channelId
        self.isEphemeral = isEphemeral
    }

    private enum CodingKeys: String, CodingKey {
        case _type = "type"
        case viewId = "view_id"
        case messageTs = "message_ts"
        case channelId = "channel_id"
        case isEphemeral = "is_ephemeral"
    }
}
