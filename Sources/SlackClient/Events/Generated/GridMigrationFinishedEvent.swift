#if Events
import Foundation

public struct GridMigrationFinishedEvent: SlackEvent {
    public var enterpriseId: Swift.String?
    public var type: Swift.String?
}
#endif
