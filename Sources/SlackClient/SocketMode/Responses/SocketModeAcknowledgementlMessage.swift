#if SocketMode
import Foundation

struct SocketModeAcknowledgementlMessage: Encodable {
    let envelopeId: String

    private enum CodingKeys: String, CodingKey {
        case envelopeId = "envelope_id"
    }
}
#endif
