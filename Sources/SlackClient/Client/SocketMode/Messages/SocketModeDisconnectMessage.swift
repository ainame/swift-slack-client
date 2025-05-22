#if SocketMode
import Foundation

struct SocketModeDisconnectMessage: Decodable {
    struct DebugInfo: Decodable {
        let host: String
    }

    let type: String
    let reason: String
    let debugInfo: DebugInfo

    enum CodingKeys: CodingKey {
        case type
        case reason
        case debugInfo
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        self.reason = try container.decode(String.self, forKey: .reason)
        self.debugInfo = try container.decode(SocketModeDisconnectMessage.DebugInfo.self, forKey: .debugInfo)
    }
}
#endif
