import Foundation

// https://docs.slack.dev/reference/interaction-payloads/shortcuts-interaction-payload
public struct GlobalShortcutPayload: InteractivePayloadProtocol, Decodable, Sendable {
    public let type: String // "shortcut"
    public let callbackId: String?
    public let triggerId: String
    public let user: Components.Schemas.User
    public let team: Components.Schemas.Team
}
