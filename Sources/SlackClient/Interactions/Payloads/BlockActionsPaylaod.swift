import Foundation

// https://docs.slack.dev/reference/interaction-payloads/block_actions-payload#fields
public struct BlockActionsPaylaod: InteractionPayload, Decodable, Sendable {
    public let type: String // "block_actions"
    public let triggerId: String?
    public let user: Components.Schemas.User
    public let team: Components.Schemas.Team
    // TODO: implement Container
    // public let container: Components.Schemas.Container
    public let apiAppId: String?
    public let actions: [Components.Schemas.Block]?
    public let channel: Components.Schemas.Channel?
    public let view: Components.Schemas.View
}

extension BlockActionsPaylaod {
    public var callbackId: String { view.callbackId! }
}
