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

/// - Remark: Generated from `#/components/schemas/Category`.
public struct Category: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Category/emoji_names`.
    public var emojiNames: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Category/name`.
    public var name: Swift.String?
    /// Creates a new `Category`.
    ///
    /// - Parameters:
    ///   - emojiNames:
    ///   - name:
    public init(
        emojiNames: [Swift.String]? = nil,
        name: Swift.String? = nil
    ) {
        self.emojiNames = emojiNames
        self.name = name
    }

    public enum CodingKeys: String, CodingKey {
        case emojiNames = "emoji_names"
        case name
    }
}
