@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
@preconcurrency import struct Foundation.URL
@preconcurrency import struct Foundation.Data
@preconcurrency import struct Foundation.Date
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/ApprovedRequest`.
public struct ApprovedRequest: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ApprovedRequest/approved_by`.
    public var approvedBy: ApprovedBy?
    /// - Remark: Generated from `#/components/schemas/ApprovedRequest/invite`.
    public var invite: Invite?
    /// - Remark: Generated from `#/components/schemas/ApprovedRequest/invite_request`.
    public var inviteRequest: InviteRequest?
    /// Creates a new `ApprovedRequest`.
    ///
    /// - Parameters:
    ///   - approvedBy:
    ///   - invite:
    ///   - inviteRequest:
    public init(
        approvedBy: ApprovedBy? = nil,
        invite: Invite? = nil,
        inviteRequest: InviteRequest? = nil
    ) {
        self.approvedBy = approvedBy
        self.invite = invite
        self.inviteRequest = inviteRequest
    }
    public enum CodingKeys: String, CodingKey {
        case approvedBy = "approved_by"
        case invite
        case inviteRequest = "invite_request"
    }
}
