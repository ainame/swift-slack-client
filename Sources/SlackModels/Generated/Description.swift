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

/// - Remark: Generated from `#/components/schemas/Description`.
public struct Description: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Description/type`.
    public var type: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Description/text`.
    public var text: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Description/emoji`.
    public var emoji: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Description/verbatim`.
    public var verbatim: Swift.Bool?
    /// Creates a new `Description`.
    ///
    /// - Parameters:
    ///   - type:
    ///   - text:
    ///   - emoji:
    ///   - verbatim:
    public init(
        type: Swift.String? = nil,
        text: Swift.String? = nil,
        emoji: Swift.Bool? = nil,
        verbatim: Swift.Bool? = nil
    ) {
        self.type = type
        self.text = text
        self.emoji = emoji
        self.verbatim = verbatim
    }
}
