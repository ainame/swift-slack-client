import Foundation
import SlackModels

// https://docs.slack.dev/reference/interaction-payloads/shortcuts-interaction-payload
public struct GlobalShortcutPayload: InteractivePayloadProtocol, Decodable, Sendable {
    public let type: String // "shortcut"
    public let callbackId: String?
    public let triggerId: String
    public let user: User
    public let team: Team
    
    private enum CodingKeys: String, CodingKey {
        case type
        case callbackId = "callback_id"
        case triggerId = "trigger_id"
        case user
        case team
    }
}
