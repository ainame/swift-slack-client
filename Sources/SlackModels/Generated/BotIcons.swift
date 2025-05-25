#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#endif
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit

/// - Remark: Generated from `#/components/schemas/BotIcons`.
public struct BotIcons: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/BotIcons/image36`.
    public var image36: Swift.String?
    /// - Remark: Generated from `#/components/schemas/BotIcons/image48`.
    public var image48: Swift.String?
    /// - Remark: Generated from `#/components/schemas/BotIcons/image72`.
    public var image72: Swift.String?
    /// Creates a new `BotIcons`.
    ///
    /// - Parameters:
    ///   - image36:
    ///   - image48:
    ///   - image72:
    public init(
        image36: Swift.String? = nil,
        image48: Swift.String? = nil,
        image72: Swift.String? = nil
    ) {
        self.image36 = image36
        self.image48 = image48
        self.image72 = image72
    }
}
