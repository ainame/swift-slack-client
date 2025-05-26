#if Events
import Foundation

public struct TeamAccessGrantedEvent: SlackEvent {
    public var eventTs: Swift.String?
    public var teamIds: [Swift.String]?
    public var type: Swift.String?
}
#endif
