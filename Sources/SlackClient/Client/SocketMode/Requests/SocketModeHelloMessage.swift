#if SocketMode
import Foundation

struct SocketModeHelloMessage: Decodable {
    struct ConnectionInfo: Decodable {
        let appId: String
        
        private enum CodingKeys: String, CodingKey {
            case appId = "app_id"
        }
    }

    struct DebugInfo: Decodable {
        let approximateConnectionTime: Int
        let buildNumber: Int
        let host: String
        
        private enum CodingKeys: String, CodingKey {
            case approximateConnectionTime = "approximate_connection_time"
            case buildNumber = "build_number"
            case host
        }
    }

    let type: String
    let connectionInfo: ConnectionInfo
    let debugInfo: DebugInfo
    let numConnections: Int

    enum CodingKeys: String, CodingKey {
        case type
        case connectionInfo = "connection_info"
        case debugInfo = "debug_info"
        case numConnections = "num_connections"
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
