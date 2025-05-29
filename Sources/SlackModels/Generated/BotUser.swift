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

/// - Remark: Generated from `#/components/schemas/BotUser`.
public struct BotUser: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/BotUser/always_online`.
    public var alwaysOnline: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/BotUser/display_name`.
    public var displayName: Swift.String?
    /// Creates a new `BotUser`.
    ///
    /// - Parameters:
    ///   - alwaysOnline:
    ///   - displayName:
    public init(
        alwaysOnline: Swift.Bool? = nil,
        displayName: Swift.String? = nil
    ) {
        self.alwaysOnline = alwaysOnline
        self.displayName = displayName
    }

    public enum CodingKeys: String, CodingKey {
        case alwaysOnline = "always_online"
        case displayName = "display_name"
    }
}
