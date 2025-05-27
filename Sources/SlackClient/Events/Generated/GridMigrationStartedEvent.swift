#if Events
import Foundation

public struct GridMigrationStartedEvent: SlackEvent {
    public var enterpriseId: Swift.String?
    public var _type: Swift.String
    public enum CodingKeys: String, CodingKey {
        case enterpriseId = "enterprise_id"
        case _type = "type"
    }
}
#endif
