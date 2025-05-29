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

/// - Remark: Generated from `#/components/schemas/InvitePreferences`.
public struct InvitePreferences: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/InvitePreferences/channel_ids`.
    public var channelIds: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/InvitePreferences/is_domain_matched`.
    public var isDomainMatched: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/InvitePreferences/is_restricted`.
    public var isRestricted: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/InvitePreferences/is_ultra_restricted`.
    public var isUltraRestricted: Swift.Bool?
    /// Creates a new `InvitePreferences`.
    ///
    /// - Parameters:
    ///   - channelIds:
    ///   - isDomainMatched:
    ///   - isRestricted:
    ///   - isUltraRestricted:
    public init(
        channelIds: [Swift.String]? = nil,
        isDomainMatched: Swift.Bool? = nil,
        isRestricted: Swift.Bool? = nil,
        isUltraRestricted: Swift.Bool? = nil
    ) {
        self.channelIds = channelIds
        self.isDomainMatched = isDomainMatched
        self.isRestricted = isRestricted
        self.isUltraRestricted = isUltraRestricted
    }

    public enum CodingKeys: String, CodingKey {
        case channelIds = "channel_ids"
        case isDomainMatched = "is_domain_matched"
        case isRestricted = "is_restricted"
        case isUltraRestricted = "is_ultra_restricted"
    }
}
