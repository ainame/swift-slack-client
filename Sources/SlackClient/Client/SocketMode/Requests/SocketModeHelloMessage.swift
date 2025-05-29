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

    let _type: String
    let connectionInfo: ConnectionInfo
    let debugInfo: DebugInfo
    let numConnections: Int

    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case connectionInfo = "connection_info"
        case debugInfo = "debug_info"
        case numConnections = "num_connections"
    }

    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        _type = try container.decode(String.self, forKey: ._type)
        connectionInfo = try container.decode(SocketModeHelloMessage.ConnectionInfo.self, forKey: .connectionInfo)
        debugInfo = try container.decode(SocketModeHelloMessage.DebugInfo.self, forKey: .debugInfo)
        numConnections = try container.decode(Int.self, forKey: .numConnections)
    }
}
#endif
