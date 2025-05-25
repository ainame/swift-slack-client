#if Events
import Foundation

public struct TeamDomainChangeEvent: SlackEvent {
    public var type: Swift.String?
    public var url: Swift.String?
    public var domain: Swift.String?
}
#endif
