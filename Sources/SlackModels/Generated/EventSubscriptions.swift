@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/EventSubscriptions`.
public struct EventSubscriptions: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/EventSubscriptions/botEvents`.
    public var botEvents: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/EventSubscriptions/userEvents`.
    public var userEvents: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/EventSubscriptions/requestUrl`.
    public var requestUrl: Swift.String?
    /// Creates a new `EventSubscriptions`.
    ///
    /// - Parameters:
    ///   - botEvents:
    ///   - userEvents:
    ///   - requestUrl:
    public init(
        botEvents: [Swift.String]? = nil,
        userEvents: [Swift.String]? = nil,
        requestUrl: Swift.String? = nil
    ) {
        self.botEvents = botEvents
        self.userEvents = userEvents
        self.requestUrl = requestUrl
    }
}
