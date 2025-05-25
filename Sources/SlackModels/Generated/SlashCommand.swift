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

/// - Remark: Generated from `#/components/schemas/SlashCommand`.
public struct SlashCommand: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/SlashCommand/command`.
    public var command: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SlashCommand/description`.
    public var description: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SlashCommand/url`.
    public var url: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SlashCommand/usageHint`.
    public var usageHint: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SlashCommand/shouldEscape`.
    public var shouldEscape: Swift.Bool?
    /// Creates a new `SlashCommand`.
    ///
    /// - Parameters:
    ///   - command:
    ///   - description:
    ///   - url:
    ///   - usageHint:
    ///   - shouldEscape:
    public init(
        command: Swift.String? = nil,
        description: Swift.String? = nil,
        url: Swift.String? = nil,
        usageHint: Swift.String? = nil,
        shouldEscape: Swift.Bool? = nil
    ) {
        self.command = command
        self.description = description
        self.url = url
        self.usageHint = usageHint
        self.shouldEscape = shouldEscape
    }
}
