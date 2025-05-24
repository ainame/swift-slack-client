import Foundation
import OpenAPIRuntime
import SlackBlockKit

// https://docs.slack.dev/reference/interaction-payloads/block_actions-payload#fields
public struct BlockActionsPaylaod: InteractivePayloadProtocol, Decodable, Sendable {
    public let type: String // "block_actions"
    public let triggerId: String?
    public let user: Components.Schemas.User
    public let team: Components.Schemas.Team
    public let container: OpenAPIObjectContainer
    public let apiAppId: String?
    public let actions: [Components.Schemas.Block]?
    public let channel: Components.Schemas.Channel?
    public let view: ViewType
}

extension BlockActionsPaylaod {
    public var callbackId: String? { view.callbackId }
}
