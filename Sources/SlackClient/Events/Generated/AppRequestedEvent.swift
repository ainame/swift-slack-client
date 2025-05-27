#if Events
import Foundation
import SlackModels

public struct AppRequestedEvent: SlackEvent {
    public var appRequest: SlackModels.AppRequest?
    public var _type: Swift.String
    public enum CodingKeys: String, CodingKey {
        case appRequest = "app_request"
        case _type = "type"
    }
}
#endif
