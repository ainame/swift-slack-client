#if Events
import Foundation

public struct TeamAccessGrantedEvent: SlackEvent {
    public var type: Swift.String?
    public var teamIds: [Swift.String]?
    public var eventTs: Swift.String?
}
#endif
