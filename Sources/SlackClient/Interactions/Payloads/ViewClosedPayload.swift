import Foundation
import SlackBlockKit
import SlackModels

/// https://docs.slack.dev/reference/interaction-payloads/view-interactions-payload#view_closed
public struct ViewClosedPayload: InteractivePayloadProtocol, Decodable, Sendable {
    /// "view_closed"
    public let _type: String
    public let enterprise: Enterprise?
    public let team: Team
    public let user: User
    public let apiAppId: String?
    public let view: View
    public let isEnterpriseInstall: Bool?
    public let isCleared: Bool
    /// Function-only metadata
    public let functionData: BlockActionsPaylaod.FunctionData?
    /// Function-only interactivity context
    public let interactivity: BlockActionsPaylaod.Interactivity?
    /// Function-only just-in-time token
    public let botAccessToken: String?

    private enum CodingKeys: String, CodingKey {
        case _type = "type"
        case enterprise
        case team
        case user
        case apiAppId = "api_app_id"
        case view
        case isEnterpriseInstall = "is_enterprise_install"
        case isCleared = "is_cleared"
        case functionData = "function_data"
        case interactivity
        case botAccessToken = "bot_access_token"
    }
}

extension ViewClosedPayload {
    public var callbackId: String? {
        view.callbackId
    }
}
