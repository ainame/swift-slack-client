#if SocketMode
import Foundation

// This is a wrapper Decodable struct to help handle completely different shape of response by
// dispatching decoding type to the decoder by `type` attribute. Actual content will be in `self.body`
// "hello" and "disconnect" are SocketMode (WebSocket) related messages from Slack platform.
struct SocketModeMessage: Decodable {
    enum Body: Decodable {
        case hello(SocketModeHelloMessage)
        case disconnect(SocketModeDisconnectMessage)
        case message(SocketModeMessageEnvelope)
    }

    let _type: String
    let body: Body

    private enum CodingKeys: String, CodingKey {
        case _type = "type"
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let _type = try container.decode(String.self, forKey: ._type)
        self._type = _type

        switch _type {
        case "hello":
            let newContainer = try decoder.singleValueContainer()
            let payload = try newContainer.decode(SocketModeHelloMessage.self)
            body = .hello(payload)
        case "disconnect":
            let newContainer = try decoder.singleValueContainer()
            let payload = try newContainer.decode(SocketModeDisconnectMessage.self)
            body = .disconnect(payload)
        default:
            let newContainer = try decoder.singleValueContainer()
            let payload = try newContainer.decode(SocketModeMessageEnvelope.self)
            body = .message(payload)
        }
    }
}
#endif
