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

/// - Remark: Generated from `#/components/schemas/InvitePayload`.
public struct InvitePayload: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/InvitePayload/channel`.
    public var channel: Channel?
    /// - Remark: Generated from `#/components/schemas/InvitePayload/invite_type`.
    public var inviteType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InvitePayload/is_external_limited`.
    public var isExternalLimited: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/InvitePayload/is_sponsored`.
    public var isSponsored: Swift.Bool?
    /// Creates a new `InvitePayload`.
    ///
    /// - Parameters:
    ///   - channel:
    ///   - inviteType:
    ///   - isExternalLimited:
    ///   - isSponsored:
    public init(
        channel: Channel? = nil,
        inviteType: Swift.String? = nil,
        isExternalLimited: Swift.Bool? = nil,
        isSponsored: Swift.Bool? = nil
    ) {
        self.channel = channel
        self.inviteType = inviteType
        self.isExternalLimited = isExternalLimited
        self.isSponsored = isSponsored
    }

    public enum CodingKeys: String, CodingKey {
        case channel
        case inviteType = "invite_type"
        case isExternalLimited = "is_external_limited"
        case isSponsored = "is_sponsored"
    }
}
