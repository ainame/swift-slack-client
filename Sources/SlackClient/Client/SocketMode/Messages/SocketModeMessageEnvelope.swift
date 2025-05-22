#if SocketMode
import Foundation

struct SocketModeMessageEnvelope: Decodable {
    enum Payload: Decodable {
        case interactive(InteractionPayloadWrapper)
        case eventsApi(EventPayload)
        case unsupported(String)
    }

    let envelopeId: String
    let type: String
    let payload: Payload
    let acceptsResponsePayload: Bool

    enum CodingKeys: CodingKey {
        case envelopeId
        case type
        case payload
        case acceptsResponsePayload
    }

    init(from decoder: any Decoder) throws {
        let container: KeyedDecodingContainer<CodingKeys> = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: CodingKeys.type)
        self.envelopeId = try container.decode(String.self, forKey: CodingKeys.envelopeId)
        self.acceptsResponsePayload = try container.decode(Bool.self, forKey: CodingKeys.acceptsResponsePayload)

        switch type {
        case "interactive":
            let interaction = try container.decode(InteractionPayloadWrapper.self, forKey: CodingKeys.payload)
            self.payload = .interactive(interaction)
        case "events_api":
            let event = try container.decode(EventPayload.self, forKey: CodingKeys.payload)
            self.payload = .eventsApi(event)
        default:
            self.payload = .unsupported(type)
        }
    }
}
#endif
