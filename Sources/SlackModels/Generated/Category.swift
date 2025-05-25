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

/// - Remark: Generated from `#/components/schemas/Category`.
public struct Category: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Category/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Category/emojiNames`.
    public var emojiNames: [Swift.String]?
    /// Creates a new `Category`.
    ///
    /// - Parameters:
    ///   - name:
    ///   - emojiNames:
    public init(
        name: Swift.String? = nil,
        emojiNames: [Swift.String]? = nil
    ) {
        self.name = name
        self.emojiNames = emojiNames
    }
}
