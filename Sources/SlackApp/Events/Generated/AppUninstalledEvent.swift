#if Events
import Foundation

public struct AppUninstalledEvent: SlackEvent {
    public var _type: Swift.String
    public enum CodingKeys: String, CodingKey {
        case _type = "type"
    }
}
#endif
