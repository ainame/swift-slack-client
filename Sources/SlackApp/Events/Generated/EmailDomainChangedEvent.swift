#if Events
import Foundation

public struct EmailDomainChangedEvent: SlackEvent {
    public var emailDomain: Swift.String?
    public var eventTs: Swift.String?
    public var _type: Swift.String
    public enum CodingKeys: String, CodingKey {
        case emailDomain = "email_domain"
        case eventTs = "event_ts"
        case _type = "type"
    }
}
#endif
