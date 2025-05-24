import Foundation
import SlackBlockKit

public struct ViewSubmissionPayload: InteractivePayloadProtocol, Decodable, Sendable {
    public let type: String // view_submission
    public let team: Components.Schemas.Team
    public let user: Components.Schemas.User
    public let view: ViewType
    public let apiAppId: String
}

extension ViewSubmissionPayload {
    public var callbackId: String? { view.callbackId }
}
