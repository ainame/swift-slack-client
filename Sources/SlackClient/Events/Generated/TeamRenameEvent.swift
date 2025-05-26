#if Events
import Foundation

public struct TeamRenameEvent: SlackEvent {
    public var name: Swift.String?
    public var type: Swift.String
}
#endif
