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

/// - Remark: Generated from `#/components/schemas/SlashCommand`.
public struct SlashCommand: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/SlashCommand/command`.
    public var command: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SlashCommand/description`.
    public var description: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SlashCommand/should_escape`.
    public var shouldEscape: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SlashCommand/url`.
    public var url: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SlashCommand/usage_hint`.
    public var usageHint: Swift.String?
    /// Creates a new `SlashCommand`.
    ///
    /// - Parameters:
    ///   - command:
    ///   - description:
    ///   - shouldEscape:
    ///   - url:
    ///   - usageHint:
    public init(
        command: Swift.String? = nil,
        description: Swift.String? = nil,
        shouldEscape: Swift.Bool? = nil,
        url: Swift.String? = nil,
        usageHint: Swift.String? = nil
    ) {
        self.command = command
        self.description = description
        self.shouldEscape = shouldEscape
        self.url = url
        self.usageHint = usageHint
    }

    public enum CodingKeys: String, CodingKey {
        case command
        case description
        case shouldEscape = "should_escape"
        case url
        case usageHint = "usage_hint"
    }
}
