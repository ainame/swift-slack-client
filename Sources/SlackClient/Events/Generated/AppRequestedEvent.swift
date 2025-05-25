#if Events
import Foundation
import SlackModels

public struct AppRequestedEvent: SlackEvent {
    public var type: Swift.String?
    public var appRequest: SlackModels.AppRequest?
}
#endif
