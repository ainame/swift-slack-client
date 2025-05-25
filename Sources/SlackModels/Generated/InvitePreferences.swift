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

/// - Remark: Generated from `#/components/schemas/InvitePreferences`.
public struct InvitePreferences: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/InvitePreferences/isRestricted`.
    public var isRestricted: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/InvitePreferences/isUltraRestricted`.
    public var isUltraRestricted: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/InvitePreferences/channelIds`.
    public var channelIds: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/InvitePreferences/isDomainMatched`.
    public var isDomainMatched: Swift.Bool?
    /// Creates a new `InvitePreferences`.
    ///
    /// - Parameters:
    ///   - isRestricted:
    ///   - isUltraRestricted:
    ///   - channelIds:
    ///   - isDomainMatched:
    public init(
        isRestricted: Swift.Bool? = nil,
        isUltraRestricted: Swift.Bool? = nil,
        channelIds: [Swift.String]? = nil,
        isDomainMatched: Swift.Bool? = nil
    ) {
        self.isRestricted = isRestricted
        self.isUltraRestricted = isUltraRestricted
        self.channelIds = channelIds
        self.isDomainMatched = isDomainMatched
    }
}
