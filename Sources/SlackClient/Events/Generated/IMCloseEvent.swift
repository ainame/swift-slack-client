#if Events
import Foundation

public struct IMCloseEvent: SlackEvent {
    public var type: Swift.String?
    public var user: Swift.String?
    public var channel: Swift.String?
    public var eventTs: Swift.String?
}
#endif
