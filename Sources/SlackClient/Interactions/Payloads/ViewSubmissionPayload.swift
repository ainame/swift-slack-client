import Foundation
import SlackBlockKit
import SlackModels

/// https://docs.slack.dev/reference/interaction-payloads/view-interactions-payload#view_submission
public struct ViewSubmissionPayload: InteractivePayloadProtocol, Decodable, Sendable {
    /// "view_submission"
    public let _type: String
    public let enterprise: Enterprise?
    public let team: Team
    public let user: User
    public let apiAppId: String?
    public let triggerId: String?
    /// Use with views.update/views.publish concurrency control
    public let hash: String?
    public let view: View
    /// Generated only for `conversations_select` / `channels_select` with `response_url_enabled: true`.
    public let responseUrls: [ResponseUrl]?
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
        case triggerId = "trigger_id"
        case hash
        case view
        case responseUrls = "response_urls"
        case functionData = "function_data"
        case interactivity
        case botAccessToken = "bot_access_token"
    }
}

extension ViewSubmissionPayload {
    public var callbackId: String? {
        view.callbackId
    }
}

extension ViewSubmissionPayload {
    public struct ResponseUrl: Decodable, Hashable, Sendable {
        public let blockId: String?
        public let actionId: String?
        public let channelId: String?
        public let responseUrl: URL?

        private enum CodingKeys: String, CodingKey {
            case blockId = "block_id"
            case actionId = "action_id"
            case channelId = "channel_id"
            case responseUrl = "response_url"
        }
    }
}
