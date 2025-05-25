#if Events
import Foundation

public struct AppMentionEvent: SlackEvent {
    public let type: String // "app_mention"
    public let user: String
    public let text: String
    public let channel: String
    public let ts: String
    public let eventTs: String
}
#endif
