#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif
#endif

/// - Remark: Generated from `#/components/schemas/DeniedRequest`.
public struct DeniedRequest: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/DeniedRequest/inviteRequest`.
    public var inviteRequest: SlackModels.InviteRequest?
    /// - Remark: Generated from `#/components/schemas/DeniedRequest/deniedBy`.
    public var deniedBy: SlackModels.DeniedBy?
    /// Creates a new `DeniedRequest`.
    ///
    /// - Parameters:
    ///   - inviteRequest:
    ///   - deniedBy:
    public init(
        inviteRequest: SlackModels.InviteRequest? = nil,
        deniedBy: SlackModels.DeniedBy? = nil
    ) {
        self.inviteRequest = inviteRequest
        self.deniedBy = deniedBy
    }
}
