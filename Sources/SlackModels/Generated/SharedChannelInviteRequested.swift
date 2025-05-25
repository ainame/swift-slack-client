@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/SharedChannelInviteRequested`.
public struct SharedChannelInviteRequested: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/SharedChannelInviteRequested/enabled`.
    public var enabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SharedChannelInviteRequested/actor`.
    public var actor: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SharedChannelInviteRequested/source`.
    public var source: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SharedChannelInviteRequested/usergroupInclude`.
    public var usergroupInclude: UsergroupClude?
    /// - Remark: Generated from `#/components/schemas/SharedChannelInviteRequested/usergroupExclude`.
    public var usergroupExclude: UsergroupClude?
    /// - Remark: Generated from `#/components/schemas/SharedChannelInviteRequested/approvalDestination`.
    public var approvalDestination: ApprovalDestination?
    /// - Remark: Generated from `#/components/schemas/SharedChannelInviteRequested/dateUpdate`.
    public var dateUpdate: Swift.Int?
    /// Creates a new `SharedChannelInviteRequested`.
    ///
    /// - Parameters:
    ///   - enabled:
    ///   - actor:
    ///   - source:
    ///   - usergroupInclude:
    ///   - usergroupExclude:
    ///   - approvalDestination:
    ///   - dateUpdate:
    public init(
        enabled: Swift.Bool? = nil,
        actor: Swift.String? = nil,
        source: Swift.String? = nil,
        usergroupInclude: UsergroupClude? = nil,
        usergroupExclude: UsergroupClude? = nil,
        approvalDestination: ApprovalDestination? = nil,
        dateUpdate: Swift.Int? = nil
    ) {
        self.enabled = enabled
        self.actor = actor
        self.source = source
        self.usergroupInclude = usergroupInclude
        self.usergroupExclude = usergroupExclude
        self.approvalDestination = approvalDestination
        self.dateUpdate = dateUpdate
    }
}
