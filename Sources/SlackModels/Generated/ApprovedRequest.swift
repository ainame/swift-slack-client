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

/// - Remark: Generated from `#/components/schemas/ApprovedRequest`.
public struct ApprovedRequest: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ApprovedRequest/invite`.
    public var invite: SlackModels.Invite?
    /// - Remark: Generated from `#/components/schemas/ApprovedRequest/inviteRequest`.
    public var inviteRequest: SlackModels.InviteRequest?
    /// - Remark: Generated from `#/components/schemas/ApprovedRequest/approvedBy`.
    public var approvedBy: SlackModels.ApprovedBy?
    /// Creates a new `ApprovedRequest`.
    ///
    /// - Parameters:
    ///   - invite:
    ///   - inviteRequest:
    ///   - approvedBy:
    public init(
        invite: SlackModels.Invite? = nil,
        inviteRequest: SlackModels.InviteRequest? = nil,
        approvedBy: SlackModels.ApprovedBy? = nil
    ) {
        self.invite = invite
        self.inviteRequest = inviteRequest
        self.approvedBy = approvedBy
    }
}
