import Foundation
import SlackBlockKit
import SlackModels

public struct ViewSubmissionPayload: InteractivePayloadProtocol, Decodable, Sendable {
    /// "view_submission"
    public let _type: String
    public let team: Team
    public let user: User
    public let view: View
    public let apiAppId: String

    private enum CodingKeys: String, CodingKey {
        case _type = "type"
        case team
        case user
        case view
        case apiAppId = "api_app_id"
    }
}

extension ViewSubmissionPayload {
    public var callbackId: String? { view.callbackId }
}
