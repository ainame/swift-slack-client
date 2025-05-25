import Foundation
import OpenAPIRuntime

public struct MessageEventMetadata: Codable, Hashable, Sendable {
    public var eventType: String?
    public var eventPayload: OpenAPIObjectContainer?
}
