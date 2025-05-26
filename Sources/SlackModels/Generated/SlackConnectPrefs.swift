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

/// - Remark: Generated from `#/components/schemas/SlackConnectPrefs`.
public struct SlackConnectPrefs: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/accept_sc_invites`.
    public var acceptScInvites: AcceptScInvites?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/allow_sc_file_uploads`.
    public var allowScFileUploads: AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/allowed_canvas_sharing`.
    public var allowedCanvasSharing: AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/allowed_list_sharing`.
    public var allowedListSharing: AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/allowed_workspaces`.
    public var allowedWorkspaces: AllowedWorkspaces?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/approved_org_info`.
    public var approvedOrgInfo: AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/away_team_sc_invite_permissions`.
    public var awayTeamScInvitePermissions: AllowedWorkspaces?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/away_team_sc_invite_require_2fa`.
    public var awayTeamScInviteRequire2fa: AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/external_awareness_context_bar`.
    public var externalAwarenessContextBar: AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/profile_visibility`.
    public var profileVisibility: AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/require_sc_channel_for_sc_dm`.
    public var requireScChannelForScDm: AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/sc_channel_limited_access`.
    public var scChannelLimitedAccess: AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/sc_mpdm_to_private`.
    public var scMpdmToPrivate: ScMpdmToPrivate?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/shared_channel_invite_requested`.
    public var sharedChannelInviteRequested: SharedChannelInviteRequested?
    /// Creates a new `SlackConnectPrefs`.
    ///
    /// - Parameters:
    ///   - acceptScInvites:
    ///   - allowScFileUploads:
    ///   - allowedCanvasSharing:
    ///   - allowedListSharing:
    ///   - allowedWorkspaces:
    ///   - approvedOrgInfo:
    ///   - awayTeamScInvitePermissions:
    ///   - awayTeamScInviteRequire2fa:
    ///   - externalAwarenessContextBar:
    ///   - profileVisibility:
    ///   - requireScChannelForScDm:
    ///   - scChannelLimitedAccess:
    ///   - scMpdmToPrivate:
    ///   - sharedChannelInviteRequested:
    public init(
        acceptScInvites: AcceptScInvites? = nil,
        allowScFileUploads: AllowScFileUploads? = nil,
        allowedCanvasSharing: AllowScFileUploads? = nil,
        allowedListSharing: AllowScFileUploads? = nil,
        allowedWorkspaces: AllowedWorkspaces? = nil,
        approvedOrgInfo: AllowScFileUploads? = nil,
        awayTeamScInvitePermissions: AllowedWorkspaces? = nil,
        awayTeamScInviteRequire2fa: AllowScFileUploads? = nil,
        externalAwarenessContextBar: AllowScFileUploads? = nil,
        profileVisibility: AllowScFileUploads? = nil,
        requireScChannelForScDm: AllowScFileUploads? = nil,
        scChannelLimitedAccess: AllowScFileUploads? = nil,
        scMpdmToPrivate: ScMpdmToPrivate? = nil,
        sharedChannelInviteRequested: SharedChannelInviteRequested? = nil
    ) {
        self.acceptScInvites = acceptScInvites
        self.allowScFileUploads = allowScFileUploads
        self.allowedCanvasSharing = allowedCanvasSharing
        self.allowedListSharing = allowedListSharing
        self.allowedWorkspaces = allowedWorkspaces
        self.approvedOrgInfo = approvedOrgInfo
        self.awayTeamScInvitePermissions = awayTeamScInvitePermissions
        self.awayTeamScInviteRequire2fa = awayTeamScInviteRequire2fa
        self.externalAwarenessContextBar = externalAwarenessContextBar
        self.profileVisibility = profileVisibility
        self.requireScChannelForScDm = requireScChannelForScDm
        self.scChannelLimitedAccess = scChannelLimitedAccess
        self.scMpdmToPrivate = scMpdmToPrivate
        self.sharedChannelInviteRequested = sharedChannelInviteRequested
    }
    public enum CodingKeys: String, CodingKey {
        case acceptScInvites = "accept_sc_invites"
        case allowScFileUploads = "allow_sc_file_uploads"
        case allowedCanvasSharing = "allowed_canvas_sharing"
        case allowedListSharing = "allowed_list_sharing"
        case allowedWorkspaces = "allowed_workspaces"
        case approvedOrgInfo = "approved_org_info"
        case awayTeamScInvitePermissions = "away_team_sc_invite_permissions"
        case awayTeamScInviteRequire2fa = "away_team_sc_invite_require_2fa"
        case externalAwarenessContextBar = "external_awareness_context_bar"
        case profileVisibility = "profile_visibility"
        case requireScChannelForScDm = "require_sc_channel_for_sc_dm"
        case scChannelLimitedAccess = "sc_channel_limited_access"
        case scMpdmToPrivate = "sc_mpdm_to_private"
        case sharedChannelInviteRequested = "shared_channel_invite_requested"
    }
}
