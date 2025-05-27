import Foundation
import OpenAPIRuntime
import SlackBlockKit
import SlackModels

// https://docs.slack.dev/reference/interaction-payloads/block_actions-payload#fields
public struct BlockActionsPaylaod: InteractivePayloadProtocol, Decodable, Sendable {
    public let _type = "block_actions"
    public let triggerId: String?
    public let user: User
    public let team: Team
    public let container: Container
    public let apiAppId: String?
    public let actions: [ActionElementType]?
    public let channel: Channel?
    public let view: ViewType
    
    private enum CodingKeys: String, CodingKey {
        case _type = "type"
        case triggerId = "trigger_id"
        case user
        case team
        case container
        case apiAppId = "api_app_id"
        case actions
        case channel
        case view
    }
}

extension BlockActionsPaylaod {
    public var callbackId: String? { view.callbackId }
}
