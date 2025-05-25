@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/DeniedRequest`.
public struct DeniedRequest: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/DeniedRequest/inviteRequest`.
    public var inviteRequest: InviteRequest?
    /// - Remark: Generated from `#/components/schemas/DeniedRequest/deniedBy`.
    public var deniedBy: DeniedBy?
    /// Creates a new `DeniedRequest`.
    ///
    /// - Parameters:
    ///   - inviteRequest:
    ///   - deniedBy:
    public init(
        inviteRequest: InviteRequest? = nil,
        deniedBy: DeniedBy? = nil
    ) {
        self.inviteRequest = inviteRequest
        self.deniedBy = deniedBy
    }
}
