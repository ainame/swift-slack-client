#if Events
import Foundation

public struct AppRateLimitedEvent: SlackEvent {
    public var apiAppId: Swift.String?
    public var minuteRateLimited: Swift.Int?
    public var teamId: Swift.String?
    public var token: Swift.String?
    public var _type: Swift.String
    public enum CodingKeys: String, CodingKey {
        case apiAppId = "api_app_id"
        case minuteRateLimited = "minute_rate_limited"
        case teamId = "team_id"
        case token
        case _type = "type"
    }
}
#endif
