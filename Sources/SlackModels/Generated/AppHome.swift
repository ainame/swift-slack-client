@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
@preconcurrency import struct Foundation.URL
@preconcurrency import struct Foundation.Data
@preconcurrency import struct Foundation.Date
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/AppHome`.
public struct AppHome: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/AppHome/home_tab_enabled`.
    public var homeTabEnabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/AppHome/messages_tab_enabled`.
    public var messagesTabEnabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/AppHome/messages_tab_read_only_enabled`.
    public var messagesTabReadOnlyEnabled: Swift.Bool?
    /// Creates a new `AppHome`.
    ///
    /// - Parameters:
    ///   - homeTabEnabled:
    ///   - messagesTabEnabled:
    ///   - messagesTabReadOnlyEnabled:
    public init(
        homeTabEnabled: Swift.Bool? = nil,
        messagesTabEnabled: Swift.Bool? = nil,
        messagesTabReadOnlyEnabled: Swift.Bool? = nil
    ) {
        self.homeTabEnabled = homeTabEnabled
        self.messagesTabEnabled = messagesTabEnabled
        self.messagesTabReadOnlyEnabled = messagesTabReadOnlyEnabled
    }
    public enum CodingKeys: String, CodingKey {
        case homeTabEnabled = "home_tab_enabled"
        case messagesTabEnabled = "messages_tab_enabled"
        case messagesTabReadOnlyEnabled = "messages_tab_read_only_enabled"
    }
}
