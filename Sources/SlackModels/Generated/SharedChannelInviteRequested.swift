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

/// - Remark: Generated from `#/components/schemas/SharedChannelInviteRequested`.
public struct SharedChannelInviteRequested: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/SharedChannelInviteRequested/actor`.
    public var actor: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SharedChannelInviteRequested/approval_destination`.
    public var approvalDestination: ApprovalDestination?
    /// - Remark: Generated from `#/components/schemas/SharedChannelInviteRequested/date_update`.
    public var dateUpdate: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SharedChannelInviteRequested/enabled`.
    public var enabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SharedChannelInviteRequested/source`.
    public var source: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SharedChannelInviteRequested/usergroup_exclude`.
    public var usergroupExclude: UsergroupClude?
    /// - Remark: Generated from `#/components/schemas/SharedChannelInviteRequested/usergroup_include`.
    public var usergroupInclude: UsergroupClude?
    /// Creates a new `SharedChannelInviteRequested`.
    ///
    /// - Parameters:
    ///   - actor:
    ///   - approvalDestination:
    ///   - dateUpdate:
    ///   - enabled:
    ///   - source:
    ///   - usergroupExclude:
    ///   - usergroupInclude:
    public init(
        actor: Swift.String? = nil,
        approvalDestination: ApprovalDestination? = nil,
        dateUpdate: Swift.Int? = nil,
        enabled: Swift.Bool? = nil,
        source: Swift.String? = nil,
        usergroupExclude: UsergroupClude? = nil,
        usergroupInclude: UsergroupClude? = nil
    ) {
        self.actor = actor
        self.approvalDestination = approvalDestination
        self.dateUpdate = dateUpdate
        self.enabled = enabled
        self.source = source
        self.usergroupExclude = usergroupExclude
        self.usergroupInclude = usergroupInclude
    }
    public enum CodingKeys: String, CodingKey {
        case actor
        case approvalDestination = "approval_destination"
        case dateUpdate = "date_update"
        case enabled
        case source
        case usergroupExclude = "usergroup_exclude"
        case usergroupInclude = "usergroup_include"
    }
}
