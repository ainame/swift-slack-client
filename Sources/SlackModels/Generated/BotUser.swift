#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif
#endif

/// - Remark: Generated from `#/components/schemas/BotUser`.
public struct BotUser: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/BotUser/displayName`.
    public var displayName: Swift.String?
    /// - Remark: Generated from `#/components/schemas/BotUser/alwaysOnline`.
    public var alwaysOnline: Swift.Bool?
    /// Creates a new `BotUser`.
    ///
    /// - Parameters:
    ///   - displayName:
    ///   - alwaysOnline:
    public init(
        displayName: Swift.String? = nil,
        alwaysOnline: Swift.Bool? = nil
    ) {
        self.displayName = displayName
        self.alwaysOnline = alwaysOnline
    }
}
