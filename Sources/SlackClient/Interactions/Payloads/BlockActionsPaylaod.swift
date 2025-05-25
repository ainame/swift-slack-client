import Foundation
import OpenAPIRuntime
import SlackBlockKit
import SlackModels

// https://docs.slack.dev/reference/interaction-payloads/block_actions-payload#fields
public struct BlockActionsPaylaod: InteractivePayloadProtocol, Decodable, Sendable {
    public let type: String // "block_actions"
    public let triggerId: String?
    public let user: User
    public let team: Team
    public let container: OpenAPIObjectContainer
    public let apiAppId: String?
    public let actions: [BlockType]?
    public let channel: Channel?
    public let view: ViewType
}

extension BlockActionsPaylaod {
    public var callbackId: String? { view.callbackId }
}
