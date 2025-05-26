#if Events
import Foundation
import SlackModels

public struct AppRequestedEvent: SlackEvent {
    public var appRequest: SlackModels.AppRequest?
    public var type: Swift.String?
}
#endif
