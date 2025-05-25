import Foundation

// Outer structure is a common wrapper to accomodate specific event's inner event payload on `event` field
// https://api.slack.com/types/event
public struct EventsApiEnvelope<Event: Decodable & Hashable & Sendable>: Decodable, Hashable, Sendable {
    public let teamId: String
    public let apiAppId: String
    public let event: Event
    public let type: String
    public let eventId: String
    public let eventTime: Int
}
