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
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/allowScFileUploads`.
    public var allowScFileUploads: AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/approvedOrgInfo`.
    public var approvedOrgInfo: AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/profileVisibility`.
    public var profileVisibility: AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/allowedWorkspaces`.
    public var allowedWorkspaces: AllowedWorkspaces?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/allowedCanvasSharing`.
    public var allowedCanvasSharing: AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/allowedListSharing`.
    public var allowedListSharing: AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/awayTeamScInvitePermissions`.
    public var awayTeamScInvitePermissions: AllowedWorkspaces?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/awayTeamScInviteRequire2fa`.
    public var awayTeamScInviteRequire2fa: AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/acceptScInvites`.
    public var acceptScInvites: AcceptScInvites?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/scChannelLimitedAccess`.
    public var scChannelLimitedAccess: AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/scMpdmToPrivate`.
    public var scMpdmToPrivate: ScMpdmToPrivate?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/externalAwarenessContextBar`.
    public var externalAwarenessContextBar: AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/requireScChannelForScDm`.
    public var requireScChannelForScDm: AllowScFileUploads?
    /// - Remark: Generated from `#/components/schemas/SlackConnectPrefs/sharedChannelInviteRequested`.
    public var sharedChannelInviteRequested: SharedChannelInviteRequested?
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
        allowScFileUploads: AllowScFileUploads? = nil,
        approvedOrgInfo: AllowScFileUploads? = nil,
        profileVisibility: AllowScFileUploads? = nil,
        allowedWorkspaces: AllowedWorkspaces? = nil,
        allowedCanvasSharing: AllowScFileUploads? = nil,
        allowedListSharing: AllowScFileUploads? = nil,
        awayTeamScInvitePermissions: AllowedWorkspaces? = nil,
        awayTeamScInviteRequire2fa: AllowScFileUploads? = nil,
        acceptScInvites: AcceptScInvites? = nil,
        scChannelLimitedAccess: AllowScFileUploads? = nil,
        scMpdmToPrivate: ScMpdmToPrivate? = nil,
        externalAwarenessContextBar: AllowScFileUploads? = nil,
        requireScChannelForScDm: AllowScFileUploads? = nil,
        sharedChannelInviteRequested: SharedChannelInviteRequested? = nil
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
