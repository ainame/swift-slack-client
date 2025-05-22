import Foundation

public struct AppMentionEvent: Decodable, Sendable {
    public let type: String
    public let user: String
    public let text: String
    public let channel: String
    public let ts: String
    public let eventTs: String
}
