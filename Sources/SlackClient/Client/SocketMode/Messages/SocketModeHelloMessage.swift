#if SocketMode
import Foundation

struct SocketModeHelloMessage: Decodable {
    struct ConnectionInfo: Decodable {
        let appId: String
    }

    struct DebugInfo: Decodable {
        let approximateConnectionTime: Int
        let buildNumber: Int
        let host: String
    }

    let type: String
    let connectionInfo: ConnectionInfo
    let debugInfo: DebugInfo
    let numConnections: Int

    enum CodingKeys: CodingKey {
        case type
        case connectionInfo
        case debugInfo
        case numConnections
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        self.connectionInfo = try container.decode(SocketModeHelloMessage.ConnectionInfo.self, forKey: .connectionInfo)
        self.debugInfo = try container.decode(SocketModeHelloMessage.DebugInfo.self, forKey: .debugInfo)
        self.numConnections = try container.decode(Int.self, forKey: .numConnections)
    }
}
#endif
