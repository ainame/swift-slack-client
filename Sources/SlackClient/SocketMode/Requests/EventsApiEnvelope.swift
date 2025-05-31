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

    private enum CodingKeys: String, CodingKey {
        case teamId = "team_id"
        case apiAppId = "api_app_id"
        case event
        case type
        case eventId = "event_id"
        case eventTime = "event_time"
    }

    init(teamId: String, apiAppId: String, event: Event, type: String, eventId: String, eventTime: Int) {
        self.teamId = teamId
        self.apiAppId = apiAppId
        self.event = event
        self.type = type
        self.eventId = eventId
        self.eventTime = eventTime
    }
}
