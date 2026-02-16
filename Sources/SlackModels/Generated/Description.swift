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

/// - Remark: Generated from `#/components/schemas/Description`.
public struct Description: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Description/emoji`.
    public var emoji: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Description/text`.
    public var text: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Description/type`.
    public var _type: Swift.String
    /// - Remark: Generated from `#/components/schemas/Description/verbatim`.
    public var verbatim: Swift.Bool?
    /// Creates a new `Description`.
    ///
    /// - Parameters:
    ///   - emoji:
    ///   - text:
    ///   - _type:
    ///   - verbatim:
    public init(
        emoji: Swift.Bool? = nil,
        text: Swift.String? = nil,
        _type: Swift.String,
        verbatim: Swift.Bool? = nil,
    ) {
        self.emoji = emoji
        self.text = text
        self._type = _type
        self.verbatim = verbatim
    }

    public enum CodingKeys: String, CodingKey {
        case emoji
        case text
        case _type = "type"
        case verbatim
    }
}
