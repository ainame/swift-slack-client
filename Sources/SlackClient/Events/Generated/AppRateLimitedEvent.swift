#if Events
import Foundation

public struct AppRateLimitedEvent: SlackEvent {
    public var type: Swift.String?
    public var token: Swift.String?
    public var teamId: Swift.String?
    public var minuteRateLimited: Swift.Int?
    public var apiAppId: Swift.String?
}
#endif
