#if SocketMode
import Foundation

// This is a wrapper Decodable struct to help handle completely different shape of response by
// dispatching decoding type to the decoder by `type` attribute. Actual content will be in `self.body`
// "hello" and "disconnect" are SocketMode (WebSocket) related messages from Slack platform.
struct SocketModeMessageType: Decodable {
    enum Body: Decodable {
        case hello(SocketModeHelloMessage)
        case disconnect(SocketModeDisconnectMessage)
        case message(SocketModeMessageEnvelope)
    }
    let type: String
    let body: Body

    enum CodingKeys: CodingKey {
        case type
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)
        self.type = type

        switch type {
        case "hello":
            let newContainer = try decoder.singleValueContainer()
            let payload = try newContainer.decode(SocketModeHelloMessage.self)
            self.body = .hello(payload)
        case "disconnect":
            let newContainer = try decoder.singleValueContainer()
            let payload = try newContainer.decode(SocketModeDisconnectMessage.self)
            self.body = .disconnect(payload)
        default:
            let newContainer = try decoder.singleValueContainer()
            let payload = try newContainer.decode(SocketModeMessageEnvelope.self)
            self.body = .message(payload)
        }
    }
}
#endif
