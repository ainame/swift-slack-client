@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/ApprovedRequest`.
public struct ApprovedRequest: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ApprovedRequest/invite`.
    public var invite: Invite?
    /// - Remark: Generated from `#/components/schemas/ApprovedRequest/inviteRequest`.
    public var inviteRequest: InviteRequest?
    /// - Remark: Generated from `#/components/schemas/ApprovedRequest/approvedBy`.
    public var approvedBy: ApprovedBy?
    /// Creates a new `ApprovedRequest`.
    ///
    /// - Parameters:
    ///   - invite:
    ///   - inviteRequest:
    ///   - approvedBy:
    public init(
        invite: Invite? = nil,
        inviteRequest: InviteRequest? = nil,
        approvedBy: ApprovedBy? = nil
    ) {
        self.invite = invite
        self.inviteRequest = inviteRequest
        self.approvedBy = approvedBy
    }
}
