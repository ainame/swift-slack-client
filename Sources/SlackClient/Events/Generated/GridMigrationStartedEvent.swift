#if Events
import Foundation

public struct GridMigrationStartedEvent: SlackEvent {
    public var type: Swift.String?
    public var enterpriseId: Swift.String?
}
#endif
