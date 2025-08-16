@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
@preconcurrency import struct Foundation.Data
@preconcurrency import struct Foundation.Date
@preconcurrency import struct Foundation.URL
#else
import struct Foundation.Data
import struct Foundation.Date
import struct Foundation.URL
#endif

/// - Remark: Generated from `#/components/schemas/EventSubscriptions`.
public struct EventSubscriptions: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/EventSubscriptions/bot_events`.
    public var botEvents: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/EventSubscriptions/request_url`.
    public var requestUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/EventSubscriptions/user_events`.
    public var userEvents: [Swift.String]?
    /// Creates a new `EventSubscriptions`.
    ///
    /// - Parameters:
    ///   - botEvents:
    ///   - requestUrl:
    ///   - userEvents:
    public init(
        botEvents: [Swift.String]? = nil,
        requestUrl: Swift.String? = nil,
        userEvents: [Swift.String]? = nil,
    ) {
        self.botEvents = botEvents
        self.requestUrl = requestUrl
        self.userEvents = userEvents
    }

    public enum CodingKeys: String, CodingKey {
        case botEvents = "bot_events"
        case requestUrl = "request_url"
        case userEvents = "user_events"
    }
}
