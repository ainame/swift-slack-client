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
}
