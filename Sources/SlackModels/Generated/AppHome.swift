@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/AppHome`.
public struct AppHome: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/AppHome/homeTabEnabled`.
    public var homeTabEnabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/AppHome/messagesTabEnabled`.
    public var messagesTabEnabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/AppHome/messagesTabReadOnlyEnabled`.
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
}
