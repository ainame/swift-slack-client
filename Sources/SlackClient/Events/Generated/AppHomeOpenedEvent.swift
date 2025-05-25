#if Events
import Foundation
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif

public struct AppHomeOpenedEvent: SlackEvent {
    public var type: Swift.String?
    public var user: Swift.String?
    public var channel: Swift.String?
    public var tab: Swift.String?
    public var view: ViewType?
    public var eventTs: Swift.String?
}
#endif
