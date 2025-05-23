#if SocketMode
import WSClient

extension Slack {
    enum SocketModeState {
        case notReady
        case ready(WebSocketOutboundWriter)

        var writer: WebSocketOutboundWriter? {
            switch self {
            case .ready(let writer):
                return writer
            case .notReady:
                return nil
            }
        }
    }
}
#endif
