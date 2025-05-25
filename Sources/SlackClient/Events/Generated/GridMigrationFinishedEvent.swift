#if Events
import Foundation

public struct GridMigrationFinishedEvent: SlackEvent {
    public var type: Swift.String?
    public var enterpriseId: Swift.String?
}
#endif
