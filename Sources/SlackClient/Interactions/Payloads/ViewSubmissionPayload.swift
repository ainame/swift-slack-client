import Foundation
import SlackBlockKit
import SlackModels

public struct ViewSubmissionPayload: InteractivePayloadProtocol, Decodable, Sendable {
    public let type: String // view_submission
    public let team: Team
    public let user: User
    public let view: ViewType
    public let apiAppId: String
    
    private enum CodingKeys: String, CodingKey {
        case type
        case team
        case user
        case view
        case apiAppId = "api_app_id"
    }
}

extension ViewSubmissionPayload {
    public var callbackId: String? { view.callbackId }
}
