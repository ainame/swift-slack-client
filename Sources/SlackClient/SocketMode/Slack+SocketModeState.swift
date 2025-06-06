#if SocketMode
import WSClient

extension Slack {
    enum SocketModeState {
        case notReady
        case ready(WebSocketOutboundWriter)

        var writer: WebSocketOutboundWriter? {
            switch self {
            case let .ready(writer):
                writer
            case .notReady:
                nil
            }
        }
    }
}
#endif
