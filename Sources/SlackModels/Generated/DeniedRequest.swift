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

/// - Remark: Generated from `#/components/schemas/DeniedRequest`.
public struct DeniedRequest: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/DeniedRequest/denied_by`.
    public var deniedBy: DeniedBy?
    /// - Remark: Generated from `#/components/schemas/DeniedRequest/invite_request`.
    public var inviteRequest: InviteRequest?
    /// Creates a new `DeniedRequest`.
    ///
    /// - Parameters:
    ///   - deniedBy:
    ///   - inviteRequest:
    public init(
        deniedBy: DeniedBy? = nil,
        inviteRequest: InviteRequest? = nil
    ) {
        self.deniedBy = deniedBy
        self.inviteRequest = inviteRequest
    }
}
