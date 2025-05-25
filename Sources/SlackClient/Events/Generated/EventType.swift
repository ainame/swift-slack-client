#if Events
import Foundation

/// Polymorphic event type that can decode any Slack event based on the type field
public enum EventType: Decodable, Hashable, Sendable {
    case appHomeOpened(AppHomeOpenedEvent)
    case appMention(AppMentionEvent)
    case appRateLimited(AppRateLimitedEvent)
    case appRequested(AppRequestedEvent)
    case appUninstalled(AppUninstalledEvent)
    case callRejected(CallRejectedEvent)
    case channelArchive(ChannelArchiveEvent)
    case channelCreated(ChannelCreatedEvent)
    case channelDeleted(ChannelDeletedEvent)
    case channelHistoryChanged(ChannelHistoryChangedEvent)
    case channelIdChanged(ChannelIDChangedEvent)
    case channelLeft(ChannelLeftEvent)
    case channelRename(ChannelRenameEvent)
    case channelShared(ChannelSharedEvent)
    case channelUnarchive(ChannelUnarchiveEvent)
    case channelUnshared(ChannelUnsharedEvent)
    case dndUpdated(DndUpdatedEvent)
    case dndUpdatedUser(DndUpdatedUserEvent)
    case emailDomainChanged(EmailDomainChangedEvent)
    case emojiChanged(EmojiChangedEvent)
    case fileChange(FileChangeEvent)
    case fileCreated(FileCreatedEvent)
    case fileDeleted(FileDeletedEvent)
    case filePublic(FilePublicEvent)
    case fileShared(FileSharedEvent)
    case fileUnshared(FileUnsharedEvent)
    case goodbye(GoodbyeEvent)
    case gridMigrationFinished(GridMigrationFinishedEvent)
    case gridMigrationStarted(GridMigrationStartedEvent)
    case groupArchive(GroupArchiveEvent)
    case groupClose(GroupCloseEvent)
    case groupDeleted(GroupDeletedEvent)
    case groupHistoryChanged(GroupHistoryChangedEvent)
    case groupLeft(GroupLeftEvent)
    case groupOpen(GroupOpenEvent)
    case groupRename(GroupRenameEvent)
    case groupUnarchive(GroupUnarchiveEvent)
    case imClose(IMCloseEvent)
    case imCreated(IMCreatedEvent)
    case imHistoryChanged(IMHistoryChangedEvent)
    case imOpen(IMOpenEvent)
    case inviteRequested(InviteRequestedEvent)
    case linkShared(LinkSharedEvent)
    case memberJoinedChannel(MemberJoinedChannelEvent)
    case memberLeftChannel(MemberLeftChannelEvent)
    case messageBot(MessageBotEvent)
    case messageChanged(MessageChangedEvent)
    case messageChannelArchive(MessageChannelArchiveEvent)
    case messageChannelJoin(MessageChannelJoinEvent)
    case messageChannelLeave(MessageChannelLeaveEvent)
    case messageChannelName(MessageChannelNameEvent)
    case messageChannelPostingPermissions(MessageChannelPostingPermissionsEvent)
    case messageChannelPurpose(MessageChannelPurposeEvent)
    case messageChannelTopic(MessageChannelTopicEvent)
    case messageChannelUnarchive(MessageChannelUnarchiveEvent)
    case messageDeleted(MessageDeletedEvent)
    case messageEkmAccessDenied(MessageEkmAccessDeniedEvent)
    case message(MessageEvent)
    case messageFileShare(MessageFileShareEvent)
    case messageGroupTopic(MessageGroupTopicEvent)
    case messageMe(MessageMeEvent)
    case messageReplied(MessageRepliedEvent)
    case messageThreadBroadcast(MessageThreadBroadcastEvent)
    case pinAdded(PinAddedEvent)
    case pinRemoved(PinRemovedEvent)
    case reactionAdded(ReactionAddedEvent)
    case reactionRemoved(ReactionRemovedEvent)
    case scopeDenied(ScopeDeniedEvent)
    case scopeGranted(ScopeGrantedEvent)
    case starAdded(StarAddedEvent)
    case starRemoved(StarRemovedEvent)
    case subteamCreated(SubteamCreatedEvent)
    case subteamMembersChanged(SubteamMembersChangedEvent)
    case subteamSelfAdded(SubteamSelfAddedEvent)
    case subteamSelfRemoved(SubteamSelfRemovedEvent)
    case subteamUpdated(SubteamUpdatedEvent)
    case teamAccessGranted(TeamAccessGrantedEvent)
    case teamAccessRevoked(TeamAccessRevokedEvent)
    case teamDomainChange(TeamDomainChangeEvent)
    case teamJoin(TeamJoinEvent)
    case teamRename(TeamRenameEvent)
    case tokensRevoked(TokensRevokedEvent)
    case userChange(UserChangeEvent)
    case userHuddleChanged(UserHuddleChangedEvent)
    case userProfileChanged(UserProfileChangedEvent)
    case userStatusChanged(UserStatusChangedEvent)
    case workflowDeleted(WorkflowDeletedEvent)
    case workflowPublished(WorkflowPublishedEvent)
    case workflowStepDeleted(WorkflowStepDeletedEvent)
    case workflowStepExecute(WorkflowStepExecuteEvent)
    case workflowUnpublished(WorkflowUnpublishedEvent)
    case unsupported(String)

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .type)

        switch type {
        case "app_home_opened":
            self = .appHomeOpened(try AppHomeOpenedEvent(from: decoder))
        case "app_mention":
            self = .appMention(try AppMentionEvent(from: decoder))
        case "app_rate_limited":
            self = .appRateLimited(try AppRateLimitedEvent(from: decoder))
        case "app_requested":
            self = .appRequested(try AppRequestedEvent(from: decoder))
        case "app_uninstalled":
            self = .appUninstalled(try AppUninstalledEvent(from: decoder))
        case "call_rejected":
            self = .callRejected(try CallRejectedEvent(from: decoder))
        case "channel_archive":
            self = .channelArchive(try ChannelArchiveEvent(from: decoder))
        case "channel_created":
            self = .channelCreated(try ChannelCreatedEvent(from: decoder))
        case "channel_deleted":
            self = .channelDeleted(try ChannelDeletedEvent(from: decoder))
        case "channel_history_changed":
            self = .channelHistoryChanged(try ChannelHistoryChangedEvent(from: decoder))
        case "channel_id_changed":
            self = .channelIdChanged(try ChannelIDChangedEvent(from: decoder))
        case "channel_left":
            self = .channelLeft(try ChannelLeftEvent(from: decoder))
        case "channel_rename":
            self = .channelRename(try ChannelRenameEvent(from: decoder))
        case "channel_shared":
            self = .channelShared(try ChannelSharedEvent(from: decoder))
        case "channel_unarchive":
            self = .channelUnarchive(try ChannelUnarchiveEvent(from: decoder))
        case "channel_unshared":
            self = .channelUnshared(try ChannelUnsharedEvent(from: decoder))
        case "dnd_updated":
            self = .dndUpdated(try DndUpdatedEvent(from: decoder))
        case "dnd_updated_user":
            self = .dndUpdatedUser(try DndUpdatedUserEvent(from: decoder))
        case "email_domain_changed":
            self = .emailDomainChanged(try EmailDomainChangedEvent(from: decoder))
        case "emoji_changed":
            self = .emojiChanged(try EmojiChangedEvent(from: decoder))
        case "file_change":
            self = .fileChange(try FileChangeEvent(from: decoder))
        case "file_created":
            self = .fileCreated(try FileCreatedEvent(from: decoder))
        case "file_deleted":
            self = .fileDeleted(try FileDeletedEvent(from: decoder))
        case "file_public":
            self = .filePublic(try FilePublicEvent(from: decoder))
        case "file_shared":
            self = .fileShared(try FileSharedEvent(from: decoder))
        case "file_unshared":
            self = .fileUnshared(try FileUnsharedEvent(from: decoder))
        case "goodbye":
            self = .goodbye(try GoodbyeEvent(from: decoder))
        case "grid_migration_finished":
            self = .gridMigrationFinished(try GridMigrationFinishedEvent(from: decoder))
        case "grid_migration_started":
            self = .gridMigrationStarted(try GridMigrationStartedEvent(from: decoder))
        case "group_archive":
            self = .groupArchive(try GroupArchiveEvent(from: decoder))
        case "group_close":
            self = .groupClose(try GroupCloseEvent(from: decoder))
        case "group_deleted":
            self = .groupDeleted(try GroupDeletedEvent(from: decoder))
        case "group_history_changed":
            self = .groupHistoryChanged(try GroupHistoryChangedEvent(from: decoder))
        case "group_left":
            self = .groupLeft(try GroupLeftEvent(from: decoder))
        case "group_open":
            self = .groupOpen(try GroupOpenEvent(from: decoder))
        case "group_rename":
            self = .groupRename(try GroupRenameEvent(from: decoder))
        case "group_unarchive":
            self = .groupUnarchive(try GroupUnarchiveEvent(from: decoder))
        case "im_close":
            self = .imClose(try IMCloseEvent(from: decoder))
        case "im_created":
            self = .imCreated(try IMCreatedEvent(from: decoder))
        case "im_history_changed":
            self = .imHistoryChanged(try IMHistoryChangedEvent(from: decoder))
        case "im_open":
            self = .imOpen(try IMOpenEvent(from: decoder))
        case "invite_requested":
            self = .inviteRequested(try InviteRequestedEvent(from: decoder))
        case "link_shared":
            self = .linkShared(try LinkSharedEvent(from: decoder))
        case "member_joined_channel":
            self = .memberJoinedChannel(try MemberJoinedChannelEvent(from: decoder))
        case "member_left_channel":
            self = .memberLeftChannel(try MemberLeftChannelEvent(from: decoder))
        case "message_bot":
            self = .messageBot(try MessageBotEvent(from: decoder))
        case "message_changed":
            self = .messageChanged(try MessageChangedEvent(from: decoder))
        case "message_channel_archive":
            self = .messageChannelArchive(try MessageChannelArchiveEvent(from: decoder))
        case "message_channel_join":
            self = .messageChannelJoin(try MessageChannelJoinEvent(from: decoder))
        case "message_channel_leave":
            self = .messageChannelLeave(try MessageChannelLeaveEvent(from: decoder))
        case "message_channel_name":
            self = .messageChannelName(try MessageChannelNameEvent(from: decoder))
        case "message_channel_posting_permissions":
            self = .messageChannelPostingPermissions(try MessageChannelPostingPermissionsEvent(from: decoder))
        case "message_channel_purpose":
            self = .messageChannelPurpose(try MessageChannelPurposeEvent(from: decoder))
        case "message_channel_topic":
            self = .messageChannelTopic(try MessageChannelTopicEvent(from: decoder))
        case "message_channel_unarchive":
            self = .messageChannelUnarchive(try MessageChannelUnarchiveEvent(from: decoder))
        case "message_deleted":
            self = .messageDeleted(try MessageDeletedEvent(from: decoder))
        case "message_ekm_access_denied":
            self = .messageEkmAccessDenied(try MessageEkmAccessDeniedEvent(from: decoder))
        case "message":
            self = .message(try MessageEvent(from: decoder))
        case "message_file_share":
            self = .messageFileShare(try MessageFileShareEvent(from: decoder))
        case "message_group_topic":
            self = .messageGroupTopic(try MessageGroupTopicEvent(from: decoder))
        case "message_me":
            self = .messageMe(try MessageMeEvent(from: decoder))
        case "message_replied":
            self = .messageReplied(try MessageRepliedEvent(from: decoder))
        case "message_thread_broadcast":
            self = .messageThreadBroadcast(try MessageThreadBroadcastEvent(from: decoder))
        case "pin_added":
            self = .pinAdded(try PinAddedEvent(from: decoder))
        case "pin_removed":
            self = .pinRemoved(try PinRemovedEvent(from: decoder))
        case "reaction_added":
            self = .reactionAdded(try ReactionAddedEvent(from: decoder))
        case "reaction_removed":
            self = .reactionRemoved(try ReactionRemovedEvent(from: decoder))
        case "scope_denied":
            self = .scopeDenied(try ScopeDeniedEvent(from: decoder))
        case "scope_granted":
            self = .scopeGranted(try ScopeGrantedEvent(from: decoder))
        case "star_added":
            self = .starAdded(try StarAddedEvent(from: decoder))
        case "star_removed":
            self = .starRemoved(try StarRemovedEvent(from: decoder))
        case "subteam_created":
            self = .subteamCreated(try SubteamCreatedEvent(from: decoder))
        case "subteam_members_changed":
            self = .subteamMembersChanged(try SubteamMembersChangedEvent(from: decoder))
        case "subteam_self_added":
            self = .subteamSelfAdded(try SubteamSelfAddedEvent(from: decoder))
        case "subteam_self_removed":
            self = .subteamSelfRemoved(try SubteamSelfRemovedEvent(from: decoder))
        case "subteam_updated":
            self = .subteamUpdated(try SubteamUpdatedEvent(from: decoder))
        case "team_access_granted":
            self = .teamAccessGranted(try TeamAccessGrantedEvent(from: decoder))
        case "team_access_revoked":
            self = .teamAccessRevoked(try TeamAccessRevokedEvent(from: decoder))
        case "team_domain_change":
            self = .teamDomainChange(try TeamDomainChangeEvent(from: decoder))
        case "team_join":
            self = .teamJoin(try TeamJoinEvent(from: decoder))
        case "team_rename":
            self = .teamRename(try TeamRenameEvent(from: decoder))
        case "tokens_revoked":
            self = .tokensRevoked(try TokensRevokedEvent(from: decoder))
        case "user_change":
            self = .userChange(try UserChangeEvent(from: decoder))
        case "user_huddle_changed":
            self = .userHuddleChanged(try UserHuddleChangedEvent(from: decoder))
        case "user_profile_changed":
            self = .userProfileChanged(try UserProfileChangedEvent(from: decoder))
        case "user_status_changed":
            self = .userStatusChanged(try UserStatusChangedEvent(from: decoder))
        case "workflow_deleted":
            self = .workflowDeleted(try WorkflowDeletedEvent(from: decoder))
        case "workflow_published":
            self = .workflowPublished(try WorkflowPublishedEvent(from: decoder))
        case "workflow_step_deleted":
            self = .workflowStepDeleted(try WorkflowStepDeletedEvent(from: decoder))
        case "workflow_step_execute":
            self = .workflowStepExecute(try WorkflowStepExecuteEvent(from: decoder))
        case "workflow_unpublished":
            self = .workflowUnpublished(try WorkflowUnpublishedEvent(from: decoder))
        default:
            self = .unsupported(type)
        }
    }

    private enum CodingKeys: String, CodingKey {
        case type
    }
}
#endif
