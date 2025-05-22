import Foundation

// Outer structure is a common wrapper to accomodate specific event's inner event payload on `event` field
// https://api.slack.com/types/event
public struct EventPayload: Decodable, Sendable {
    public let teamId: String
    public let apiAppId: String
    public let event: Event
    public let type: String
    public let eventId: String
    public let eventTime: Int
}

extension EventPayload {
    // Inner event structure varies depending on what API you use
    public enum Event: Decodable, Sendable {
        case appMentionEvent(AppMentionEvent)
    }
}

extension EventPayload.Event {
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)

        switch type {
        case "app_mention":
            self = .appMentionEvent(try AppMentionEvent(from: decoder))
        default:
            throw DecodingError.dataCorruptedError(
                forKey: .type,
                in: container,
                debugDescription: "type=\(type) isn't supported yet."
            )
        }
    }

    enum CodingKeys: String, CodingKey {
        case type
    }
}
