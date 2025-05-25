#if Events
import Foundation

public struct AppRequestedEvent: SlackEvent {
    public var type: Swift.String?
    public var appRequest: Components.Schemas.AppRequest?
}
#endif
