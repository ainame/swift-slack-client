#if Events
import Foundation
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

public struct AppHomeOpenedEvent: SlackEvent {
    public var channel: Swift.String?
    public var eventTs: Swift.String?
    public var tab: Swift.String?
    public var _type: Swift.String
    public var user: Swift.String?
    public var view: View?
    public enum CodingKeys: String, CodingKey {
        case channel
        case eventTs = "event_ts"
        case tab
        case _type = "type"
        case user
        case view
    }
}
#endif
