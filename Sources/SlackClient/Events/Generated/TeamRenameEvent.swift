#if Events
import Foundation

public struct TeamRenameEvent: SlackEvent {
    public var type: Swift.String?
    public var name: Swift.String?
}
#endif
