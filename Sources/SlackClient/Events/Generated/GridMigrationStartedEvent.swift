#if Events
import Foundation

public struct GridMigrationStartedEvent: SlackEvent {
    public var enterpriseId: Swift.String?
    public var type: Swift.String?
}
#endif
