#if Events
import Foundation

public struct TeamDomainChangeEvent: SlackEvent {
    public var domain: Swift.String?
    public var type: Swift.String
    public var url: Swift.String?
}
#endif
