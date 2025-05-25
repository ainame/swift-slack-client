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

/// - Remark: Generated from `#/components/schemas/SlackConnectPrefs`.
public struct SlackConnectPrefs: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/allowScFileUploads`.
    public var allowScFileUploads: SlackModels.AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/approvedOrgInfo`.
    public var approvedOrgInfo: SlackModels.AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/profileVisibility`.
    public var profileVisibility: SlackModels.AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/allowedWorkspaces`.
    public var allowedWorkspaces: SlackModels.AllowedWorkspaces?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/allowedCanvasSharing`.
    public var allowedCanvasSharing: SlackModels.AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/allowedListSharing`.
    public var allowedListSharing: SlackModels.AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/awayTeamScInvitePermissions`.
    public var awayTeamScInvitePermissions: SlackModels.AllowedWorkspaces?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/awayTeamScInviteRequire2fa`.
    public var awayTeamScInviteRequire2fa: SlackModels.AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/acceptScInvites`.
    public var acceptScInvites: SlackModels.AcceptScInvites?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/scChannelLimitedAccess`.
    public var scChannelLimitedAccess: SlackModels.AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/scMpdmToPrivate`.
    public var scMpdmToPrivate: SlackModels.ScMpdmToPrivate?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/externalAwarenessContextBar`.
    public var externalAwarenessContextBar: SlackModels.AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/requireScChannelForScDm`.
    public var requireScChannelForScDm: SlackModels.AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/sharedChannelInviteRequested`.
    public var sharedChannelInviteRequested: SlackModels.SharedChannelInviteRequested?
    /// Creates a new `SlackConnectPrefs`.
    ///
    /// - Parameters:
    ///   - allowScFileUploads:
    ///   - approvedOrgInfo:
    ///   - profileVisibility:
    ///   - allowedWorkspaces:
    ///   - allowedCanvasSharing:
    ///   - allowedListSharing:
    ///   - awayTeamScInvitePermissions:
    ///   - awayTeamScInviteRequire2fa:
    ///   - acceptScInvites:
    ///   - scChannelLimitedAccess:
    ///   - scMpdmToPrivate:
    ///   - externalAwarenessContextBar:
    ///   - requireScChannelForScDm:
    ///   - sharedChannelInviteRequested:
    public init(
        allowScFileUploads: SlackModels.AllowScFileUploads? = nil,
        approvedOrgInfo: SlackModels.AllowScFileUploads? = nil,
        profileVisibility: SlackModels.AllowScFileUploads? = nil,
        allowedWorkspaces: SlackModels.AllowedWorkspaces? = nil,
        allowedCanvasSharing: SlackModels.AllowScFileUploads? = nil,
        allowedListSharing: SlackModels.AllowScFileUploads? = nil,
        awayTeamScInvitePermissions: SlackModels.AllowedWorkspaces? = nil,
        awayTeamScInviteRequire2fa: SlackModels.AllowScFileUploads? = nil,
        acceptScInvites: SlackModels.AcceptScInvites? = nil,
        scChannelLimitedAccess: SlackModels.AllowScFileUploads? = nil,
        scMpdmToPrivate: SlackModels.ScMpdmToPrivate? = nil,
        externalAwarenessContextBar: SlackModels.AllowScFileUploads? = nil,
        requireScChannelForScDm: SlackModels.AllowScFileUploads? = nil,
        sharedChannelInviteRequested: SlackModels.SharedChannelInviteRequested? = nil
    ) {
        self.allowScFileUploads = allowScFileUploads
        self.approvedOrgInfo = approvedOrgInfo
        self.profileVisibility = profileVisibility
        self.allowedWorkspaces = allowedWorkspaces
        self.allowedCanvasSharing = allowedCanvasSharing
        self.allowedListSharing = allowedListSharing
        self.awayTeamScInvitePermissions = awayTeamScInvitePermissions
        self.awayTeamScInviteRequire2fa = awayTeamScInviteRequire2fa
        self.acceptScInvites = acceptScInvites
        self.scChannelLimitedAccess = scChannelLimitedAccess
        self.scMpdmToPrivate = scMpdmToPrivate
        self.externalAwarenessContextBar = externalAwarenessContextBar
        self.requireScChannelForScDm = requireScChannelForScDm
        self.sharedChannelInviteRequested = sharedChannelInviteRequested
    }
}
