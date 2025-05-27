#if SocketMode
import Foundation

public struct SocketModeMessageEnvelope: Decodable, Hashable, Sendable {
    public enum Payload: Decodable, Hashable, Sendable {
        case interactive(InteractiveEnvelope)
#if Events
        case eventsApi(EventsApiEnvelope<EventType>)
#endif
        case unsupported(String)
    }

    public let envelopeId: String
    public let type: String
    public let payload: Payload
    public let acceptsResponsePayload: Bool

    public enum CodingKeys: String, CodingKey {
        case envelopeId = "envelope_id"
        case type
        case payload
        case acceptsResponsePayload = "accepts_response_payload"
    }

    public init(from decoder: any Decoder) throws {
        let container: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: CodingKeys.type)
        self.envelopeId = try container.decode(String.self, forKey: CodingKeys.envelopeId)
        self.acceptsResponsePayload = try container.decode(Bool.self, forKey: CodingKeys.acceptsResponsePayload)

        switch type {
        case "interactive":
            let interaction = try container.decode(InteractiveEnvelope.self, forKey: CodingKeys.payload)
            self.payload = .interactive(interaction)
#if Events
        case "events_api":
            let event = try container.decode(EventsApiEnvelope<EventType>.self, forKey: CodingKeys.payload)
            self.payload = .eventsApi(event)
#endif
        default:
            self.payload = .unsupported(type)
        }
    }
}
#endif
