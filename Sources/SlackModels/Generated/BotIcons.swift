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

/// - Remark: Generated from `#/components/schemas/BotIcons`.
public struct BotIcons: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/BotIcons/image_36`.
    public var image36: Swift.String?
    /// - Remark: Generated from `#/components/schemas/BotIcons/image_48`.
    public var image48: Swift.String?
    /// - Remark: Generated from `#/components/schemas/BotIcons/image_72`.
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
        image72: Swift.String? = nil,
    ) {
        self.image36 = image36
        self.image48 = image48
        self.image72 = image72
    }

    public enum CodingKeys: String, CodingKey {
        case image36 = "image_36"
        case image48 = "image_48"
        case image72 = "image_72"
    }
}
