#if Events
import Foundation

public struct EmailDomainChangedEvent: SlackEvent {
    public var type: Swift.String?
    public var emailDomain: Swift.String?
    public var eventTs: Swift.String?
}
#endif
