@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/InvitePayload`.
public struct InvitePayload: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/InvitePayload/channel`.
    public var channel: Channel?
    /// - Remark: Generated from `#/components/schemas/InvitePayload/inviteType`.
    public var inviteType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/InvitePayload/isSponsored`.
    public var isSponsored: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/InvitePayload/isExternalLimited`.
    public var isExternalLimited: Swift.Bool?
    /// Creates a new `InvitePayload`.
    ///
    /// - Parameters:
    ///   - channel:
    ///   - inviteType:
    ///   - isSponsored:
    ///   - isExternalLimited:
    public init(
        channel: Channel? = nil,
        inviteType: Swift.String? = nil,
        isSponsored: Swift.Bool? = nil,
        isExternalLimited: Swift.Bool? = nil
    ) {
        self.channel = channel
        self.inviteType = inviteType
        self.isSponsored = isSponsored
        self.isExternalLimited = isExternalLimited
    }
}
