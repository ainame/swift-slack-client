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

/// - Remark: Generated from `#/components/schemas/Description`.
public struct Description: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Description/emoji`.
    public var emoji: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Description/text`.
    public var text: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Description/type`.
    public var type: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Description/verbatim`.
    public var verbatim: Swift.Bool?
    /// Creates a new `Description`.
    ///
    /// - Parameters:
    ///   - emoji:
    ///   - text:
    ///   - type:
    ///   - verbatim:
    public init(
        emoji: Swift.Bool? = nil,
        text: Swift.String? = nil,
        type: Swift.String? = nil,
        verbatim: Swift.Bool? = nil
    ) {
        self.emoji = emoji
        self.text = text
        self.type = type
        self.verbatim = verbatim
    }
}
