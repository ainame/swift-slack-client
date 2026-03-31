#if Events
import Foundation

public struct TeamDomainChangeEvent: SlackEvent {
    public var domain: Swift.String?
    public var _type: Swift.String
    public var url: Swift.String?
    public enum CodingKeys: String, CodingKey {
        case domain
        case _type = "type"
        case url
    }
}
#endif
