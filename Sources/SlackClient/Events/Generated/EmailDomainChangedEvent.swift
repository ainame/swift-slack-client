#if Events
import Foundation

public struct EmailDomainChangedEvent: SlackEvent {
    public var emailDomain: Swift.String?
    public var eventTs: Swift.String?
    public var type: Swift.String?
}
#endif
