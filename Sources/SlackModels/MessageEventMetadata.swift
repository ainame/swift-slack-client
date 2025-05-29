import Foundation
import OpenAPIRuntime

public struct MessageEventMetadata: Codable, Hashable, Sendable {
    public var eventType: String?
    public var eventPayload: OpenAPIObjectContainer?

    private enum CodingKeys: String, CodingKey {
        case eventType = "event_type"
        case eventPayload = "event_payload"
    }
}
