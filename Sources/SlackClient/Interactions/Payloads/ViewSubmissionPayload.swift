import Foundation

public struct ViewSubmissionPayload: InteractionPayload, Decodable, Sendable {
    public let type: String // view_submission
    public let team: Components.Schemas.Team
    public let user: Components.Schemas.User
    public let view: Components.Schemas.View
    public let apiAppId: String
}

extension ViewSubmissionPayload {
    public var callbackId: String { view.callbackId! }
}
