#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#endif
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit

/// - Remark: Generated from `#/components/schemas/SharedChannelInviteRequested`.
public struct SharedChannelInviteRequested: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/SharedChannelInviteRequested/enabled`.
    public var enabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SharedChannelInviteRequested/actor`.
    public var actor: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SharedChannelInviteRequested/source`.
    public var source: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SharedChannelInviteRequested/usergroupInclude`.
    public var usergroupInclude: SlackModels.UsergroupClude?
    /// - Remark: Generated from `#/components/schemas/SharedChannelInviteRequested/usergroupExclude`.
    public var usergroupExclude: SlackModels.UsergroupClude?
    /// - Remark: Generated from `#/components/schemas/SharedChannelInviteRequested/approvalDestination`.
    public var approvalDestination: SlackModels.ApprovalDestination?
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
        usergroupInclude: SlackModels.UsergroupClude? = nil,
        usergroupExclude: SlackModels.UsergroupClude? = nil,
        approvalDestination: SlackModels.ApprovalDestination? = nil,
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
