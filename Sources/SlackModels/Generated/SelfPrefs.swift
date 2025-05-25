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

/// - Remark: Generated from `#/components/schemas/SelfPrefs`.
public struct SelfPrefs: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/time24`.
    public var time24: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/jumbomoji`.
    public var jumbomoji: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/locale`.
    public var locale: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/purchaser`.
    public var purchaser: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/tz`.
    public var tz: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/frecency`.
    public var frecency: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/underlineLinks`.
    public var underlineLinks: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/userColors`.
    public var userColors: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/colorNamesInList`.
    public var colorNamesInList: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/emailAlerts`.
    public var emailAlerts: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/emailAlertsSleepUntil`.
    public var emailAlertsSleepUntil: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/emailTips`.
    public var emailTips: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/emailWeekly`.
    public var emailWeekly: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/emailOffers`.
    public var emailOffers: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/emailResearch`.
    public var emailResearch: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/emailDeveloper`.
    public var emailDeveloper: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/welcomeMessageHidden`.
    public var welcomeMessageHidden: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/searchSort`.
    public var searchSort: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/searchFileSort`.
    public var searchFileSort: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/searchChannelSort`.
    public var searchChannelSort: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/searchPeopleSort`.
    public var searchPeopleSort: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/expandInlineImgs`.
    public var expandInlineImgs: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/expandInternalInlineImgs`.
    public var expandInternalInlineImgs: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/expandSnippets`.
    public var expandSnippets: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/postsFormattingGuide`.
    public var postsFormattingGuide: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenWelcome2`.
    public var seenWelcome2: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenSsbPrompt`.
    public var seenSsbPrompt: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/spacesNewXpBannerDismissed`.
    public var spacesNewXpBannerDismissed: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/searchOnlyMyChannels`.
    public var searchOnlyMyChannels: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/searchOnlyCurrentTeam`.
    public var searchOnlyCurrentTeam: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/searchHideMyChannels`.
    public var searchHideMyChannels: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/searchOnlyShowOnline`.
    public var searchOnlyShowOnline: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/searchHideDeactivatedUsers`.
    public var searchHideDeactivatedUsers: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/emojiMode`.
    public var emojiMode: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/emojiUse`.
    public var emojiUse: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/emojiUseOrg`.
    public var emojiUseOrg: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/hasInvited`.
    public var hasInvited: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/hasUploaded`.
    public var hasUploaded: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/hasCreatedChannel`.
    public var hasCreatedChannel: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/hasCreatedChannelSection`.
    public var hasCreatedChannelSection: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/hasSearched`.
    public var hasSearched: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/searchExcludeChannels`.
    public var searchExcludeChannels: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/messagesTheme`.
    public var messagesTheme: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/webappSpellcheck`.
    public var webappSpellcheck: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/noJoinedOverlays`.
    public var noJoinedOverlays: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/noCreatedOverlays`.
    public var noCreatedOverlays: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dropboxEnabled`.
    public var dropboxEnabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenDomainInviteReminder`.
    public var seenDomainInviteReminder: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenMemberInviteReminder`.
    public var seenMemberInviteReminder: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/muteSounds`.
    public var muteSounds: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/arrowHistory`.
    public var arrowHistory: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/tabUiReturnSelects`.
    public var tabUiReturnSelects: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/obeyInlineImgLimit`.
    public var obeyInlineImgLimit: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/requireAt`.
    public var requireAt: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/ssbSpaceWindow`.
    public var ssbSpaceWindow: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/macSsbBounce`.
    public var macSsbBounce: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/macSsbBullet`.
    public var macSsbBullet: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/expandNonMediaAttachments`.
    public var expandNonMediaAttachments: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/showTyping`.
    public var showTyping: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/pagekeysHandled`.
    public var pagekeysHandled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/lastSnippetType`.
    public var lastSnippetType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/displayRealNamesOverride`.
    public var displayRealNamesOverride: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/displayDisplayNames`.
    public var displayDisplayNames: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enterIsSpecialInTbt`.
    public var enterIsSpecialInTbt: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/msgInputSendBtn`.
    public var msgInputSendBtn: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/msgInputSendBtnAutoSet`.
    public var msgInputSendBtnAutoSet: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/msgInputStickyComposer`.
    public var msgInputStickyComposer: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/composerNux`.
    public var composerNux: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/graphicEmoticons`.
    public var graphicEmoticons: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/convertEmoticons`.
    public var convertEmoticons: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/ssEmojis`.
    public var ssEmojis: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenOnboardingStart`.
    public var seenOnboardingStart: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/onboardingCancelled`.
    public var onboardingCancelled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenOnboardingSlackbotConversation`.
    public var seenOnboardingSlackbotConversation: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenOnboardingChannels`.
    public var seenOnboardingChannels: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenOnboardingDirectMessages`.
    public var seenOnboardingDirectMessages: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenOnboardingInvites`.
    public var seenOnboardingInvites: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenOnboardingSearch`.
    public var seenOnboardingSearch: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenOnboardingRecentMentions`.
    public var seenOnboardingRecentMentions: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenOnboardingStarredItems`.
    public var seenOnboardingStarredItems: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenOnboardingPrivateGroups`.
    public var seenOnboardingPrivateGroups: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenOnboardingBanner`.
    public var seenOnboardingBanner: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/onboardingSlackbotConversationStep`.
    public var onboardingSlackbotConversationStep: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/setTzAutomatically`.
    public var setTzAutomatically: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/suppressLinkWarning`.
    public var suppressLinkWarning: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/suppressExternalInvitesFromComposeWarning`.
    public var suppressExternalInvitesFromComposeWarning: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenEmojiPackCta`.
    public var seenEmojiPackCta: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenEmojiPackDialog`.
    public var seenEmojiPackDialog: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenScheduleSendCoachmark`.
    public var seenScheduleSendCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/emojiPacksMostRecentAvailableTime`.
    public var emojiPacksMostRecentAvailableTime: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/emojiPacksClickedPickerCta`.
    public var emojiPacksClickedPickerCta: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/emojiPacksClickedPickerPostInstallCta`.
    public var emojiPacksClickedPickerPostInstallCta: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/emojiPacksClickedCollectionCta`.
    public var emojiPacksClickedCollectionCta: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndEnabled`.
    public var dndEnabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndStartHour`.
    public var dndStartHour: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndEndHour`.
    public var dndEndHour: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndBeforeMonday`.
    public var dndBeforeMonday: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndAfterMonday`.
    public var dndAfterMonday: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndEnabledMonday`.
    public var dndEnabledMonday: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndBeforeTuesday`.
    public var dndBeforeTuesday: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndAfterTuesday`.
    public var dndAfterTuesday: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndEnabledTuesday`.
    public var dndEnabledTuesday: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndBeforeWednesday`.
    public var dndBeforeWednesday: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndAfterWednesday`.
    public var dndAfterWednesday: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndEnabledWednesday`.
    public var dndEnabledWednesday: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndBeforeThursday`.
    public var dndBeforeThursday: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndAfterThursday`.
    public var dndAfterThursday: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndEnabledThursday`.
    public var dndEnabledThursday: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndBeforeFriday`.
    public var dndBeforeFriday: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndAfterFriday`.
    public var dndAfterFriday: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndEnabledFriday`.
    public var dndEnabledFriday: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndBeforeSaturday`.
    public var dndBeforeSaturday: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndAfterSaturday`.
    public var dndAfterSaturday: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndEnabledSaturday`.
    public var dndEnabledSaturday: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndBeforeSunday`.
    public var dndBeforeSunday: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndAfterSunday`.
    public var dndAfterSunday: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndEnabledSunday`.
    public var dndEnabledSunday: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndDays`.
    public var dndDays: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndWeekdaysOffAllday`.
    public var dndWeekdaysOffAllday: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/reminderNotificationTime`.
    public var reminderNotificationTime: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndCustomNewBadgeSeen`.
    public var dndCustomNewBadgeSeen: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dndNotificationScheduleNewBadgeSeen`.
    public var dndNotificationScheduleNewBadgeSeen: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/notificationCenterFilters`.
    public var notificationCenterFilters: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/callsSurveyLastSeen`.
    public var callsSurveyLastSeen: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/huddleSurveyLastSeen`.
    public var huddleSurveyLastSeen: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/sidebarBehavior`.
    public var sidebarBehavior: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/channelSort`.
    public var channelSort: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/separatePrivateChannels`.
    public var separatePrivateChannels: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/separateSharedChannels`.
    public var separateSharedChannels: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/sidebarTheme`.
    public var sidebarTheme: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/sidebarThemeCustomValues`.
    public var sidebarThemeCustomValues: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/noInvitesWidgetInSidebar`.
    public var noInvitesWidgetInSidebar: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/noOmniboxInChannels`.
    public var noOmniboxInChannels: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/kKeyOmniboxAutoHideCount`.
    public var kKeyOmniboxAutoHideCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/showSidebarQuickswitcherButton`.
    public var showSidebarQuickswitcherButton: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/entOrgWideChannelsSidebar`.
    public var entOrgWideChannelsSidebar: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/markMsgsReadImmediately`.
    public var markMsgsReadImmediately: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/startScrollAtOldest`.
    public var startScrollAtOldest: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/snippetEditorWrapLongLines`.
    public var snippetEditorWrapLongLines: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/lsDisabled`.
    public var lsDisabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/fKeySearch`.
    public var fKeySearch: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/kKeyOmnibox`.
    public var kKeyOmnibox: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/promptedForEmailDisabling`.
    public var promptedForEmailDisabling: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/noMacelectronBanner`.
    public var noMacelectronBanner: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/noMacssb1Banner`.
    public var noMacssb1Banner: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/noMacssb2Banner`.
    public var noMacssb2Banner: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/noWinssb1Banner`.
    public var noWinssb1Banner: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/hideUserGroupInfoPane`.
    public var hideUserGroupInfoPane: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/mentionsExcludeAtUserGroups`.
    public var mentionsExcludeAtUserGroups: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/mentionsExcludeReactions`.
    public var mentionsExcludeReactions: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/privacyPolicySeen`.
    public var privacyPolicySeen: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enterpriseMigrationSeen`.
    public var enterpriseMigrationSeen: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/searchExcludeBots`.
    public var searchExcludeBots: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/loadLato2`.
    public var loadLato2: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/fullerTimestamps`.
    public var fullerTimestamps: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/lastSeenAtChannelWarning`.
    public var lastSeenAtChannelWarning: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/emojiAutocompleteBig`.
    public var emojiAutocompleteBig: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/twoFactorAuthEnabled`.
    public var twoFactorAuthEnabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/hideHexSwatch`.
    public var hideHexSwatch: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/showJumperScores`.
    public var showJumperScores: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enterpriseMdmCustomMsg`.
    public var enterpriseMdmCustomMsg: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/clientLogsPri`.
    public var clientLogsPri: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/flannelServerPool`.
    public var flannelServerPool: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/mentionsExcludeAtChannels`.
    public var mentionsExcludeAtChannels: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/confirmClearAllUnreads`.
    public var confirmClearAllUnreads: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/confirmUserMarkedAway`.
    public var confirmUserMarkedAway: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/boxEnabled`.
    public var boxEnabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenSingleEmojiMsg`.
    public var seenSingleEmojiMsg: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/confirmShCallStart`.
    public var confirmShCallStart: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/preferredSkinTone`.
    public var preferredSkinTone: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/showAllSkinTones`.
    public var showAllSkinTones: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/whatsNewRead`.
    public var whatsNewRead: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/helpModalOpenTimestamp`.
    public var helpModalOpenTimestamp: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/helpModalConsultBannerDismissed`.
    public var helpModalConsultBannerDismissed: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/helpFlexpaneSlackConnectCardSeen`.
    public var helpFlexpaneSlackConnectCardSeen: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/helpFlexpaneClipsCardSeen`.
    public var helpFlexpaneClipsCardSeen: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/helpMenuOpenTimestamp`.
    public var helpMenuOpenTimestamp: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/frecencyJumper`.
    public var frecencyJumper: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/frecencyEntJumper`.
    public var frecencyEntJumper: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/newxpSeenLastMessage`.
    public var newxpSeenLastMessage: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/showMemoryInstrument`.
    public var showMemoryInstrument: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enableUnreadView`.
    public var enableUnreadView: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenUnreadViewCoachmark`.
    public var seenUnreadViewCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenConnectDmCoachmark`.
    public var seenConnectDmCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenConnectSectionCoachmark`.
    public var seenConnectSectionCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/shouldShowConnectSection`.
    public var shouldShowConnectSection: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enableReactEmojiPicker`.
    public var enableReactEmojiPicker: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenCustomStatusBadge`.
    public var seenCustomStatusBadge: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenCustomStatusCallout`.
    public var seenCustomStatusCallout: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenCustomStatusExpirationBadge`.
    public var seenCustomStatusExpirationBadge: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/usedCustomStatusKbShortcut`.
    public var usedCustomStatusKbShortcut: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenGuestAdminSlackbotAnnouncement`.
    public var seenGuestAdminSlackbotAnnouncement: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenThreadsNotificationBanner`.
    public var seenThreadsNotificationBanner: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenNameTaggingCoachmark`.
    public var seenNameTaggingCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/allUnreadsSortOrder`.
    public var allUnreadsSortOrder: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/allUnreadsSectionFilter`.
    public var allUnreadsSectionFilter: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenIntlChannelNamesCoachmark`.
    public var seenIntlChannelNamesCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenP3LocaleChangeMessageKoKr`.
    public var seenP3LocaleChangeMessageKoKr: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenToastNewLocaleLaunch`.
    public var seenToastNewLocaleLaunch: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenToastNewLocaleLaunchTs`.
    public var seenToastNewLocaleLaunchTs: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenLocaleChangeMessage`.
    public var seenLocaleChangeMessage: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenJapaneseLocaleChangeMessage`.
    public var seenJapaneseLocaleChangeMessage: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenSharedChannelsCoachmark`.
    public var seenSharedChannelsCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenSharedChannelsOptInChangeMessage`.
    public var seenSharedChannelsOptInChangeMessage: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/hasRecentlySharedAChannel`.
    public var hasRecentlySharedAChannel: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenChannelBrowserAdminCoachmark`.
    public var seenChannelBrowserAdminCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenAdministrationMenu`.
    public var seenAdministrationMenu: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenDraftsSectionCoachmark`.
    public var seenDraftsSectionCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenEmojiUpdateOverlayCoachmark`.
    public var seenEmojiUpdateOverlayCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenSonicDeluxeToast`.
    public var seenSonicDeluxeToast: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenWysiwygDeluxeToast`.
    public var seenWysiwygDeluxeToast: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenMarkdownPasteToast`.
    public var seenMarkdownPasteToast: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenMarkdownPasteShortcut`.
    public var seenMarkdownPasteShortcut: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenIaEducation`.
    public var seenIaEducation: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/showIaTourRelaunch`.
    public var showIaTourRelaunch: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/plainTextMode`.
    public var plainTextMode: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/showSharedChannelsEducationBanner`.
    public var showSharedChannelsEducationBanner: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/iaSlackbotSurveyTimestamp48h`.
    public var iaSlackbotSurveyTimestamp48h: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/iaSlackbotSurveyTimestamp7d`.
    public var iaSlackbotSurveyTimestamp7d: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enableStreamlineView`.
    public var enableStreamlineView: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enableSentView`.
    public var enableSentView: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/allowCallsToSetCurrentStatus`.
    public var allowCallsToSetCurrentStatus: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/inInteractiveMasMigrationFlow`.
    public var inInteractiveMasMigrationFlow: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/sunsetInteractiveMessageViews`.
    public var sunsetInteractiveMessageViews: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/shdepPromoCodeSubmitted`.
    public var shdepPromoCodeSubmitted: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenShdepSlackbotMessage`.
    public var seenShdepSlackbotMessage: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenCallsInteractiveCoachmark`.
    public var seenCallsInteractiveCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/allowCmdTabIss`.
    public var allowCmdTabIss: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/joinCallsDeviceSettings`.
    public var joinCallsDeviceSettings: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/callsDisconnectOnLock`.
    public var callsDisconnectOnLock: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenWorkflowBuilderDeluxeToast`.
    public var seenWorkflowBuilderDeluxeToast: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/workflowBuilderIntroModalClickedThrough`.
    public var workflowBuilderIntroModalClickedThrough: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/workflowBuilderCoachmarks`.
    public var workflowBuilderCoachmarks: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenGdriveCoachmark`.
    public var seenGdriveCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenFirstInstallCoachmark`.
    public var seenFirstInstallCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenExistingInstallCoachmark`.
    public var seenExistingInstallCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenLinkUnfurlCoachmark`.
    public var seenLinkUnfurlCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/filePickerVariant`.
    public var filePickerVariant: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/openQuipDocInFlexpane`.
    public var openQuipDocInFlexpane: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/savedSearches`.
    public var savedSearches: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/huddlesVariant`.
    public var huddlesVariant: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/huddlesCcByDefault`.
    public var huddlesCcByDefault: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/huddlesMuteByDefault`.
    public var huddlesMuteByDefault: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/huddlesGlobalMute`.
    public var huddlesGlobalMute: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/huddlesMiniPanel`.
    public var huddlesMiniPanel: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/huddlesSetStatus`.
    public var huddlesSetStatus: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/huddlesShowShoutyRooster`.
    public var huddlesShowShoutyRooster: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/huddlesDisconnectOnLock`.
    public var huddlesDisconnectOnLock: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/huddlesPlayMusicWhenLast`.
    public var huddlesPlayMusicWhenLast: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/huddlesAllowSmartNotif`.
    public var huddlesAllowSmartNotif: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/huddlesReactionsPlaySound`.
    public var huddlesReactionsPlaySound: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/huddlesReactionsReadOutLoud`.
    public var huddlesReactionsReadOutLoud: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/huddlesChimeNewEndpointsCheckCompleted`.
    public var huddlesChimeNewEndpointsCheckCompleted: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/xwsSidebarVariant`.
    public var xwsSidebarVariant: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/inboxViewsWorkspaceFilter`.
    public var inboxViewsWorkspaceFilter: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/overloadedMessageEnabled`.
    public var overloadedMessageEnabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenHighlightsCoachmark`.
    public var seenHighlightsCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenHighlightsArrowsCoachmark`.
    public var seenHighlightsArrowsCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenHighlightsWarmWelcome`.
    public var seenHighlightsWarmWelcome: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenNewSearchUi`.
    public var seenNewSearchUi: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenChannelSearch`.
    public var seenChannelSearch: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenPeopleSearch`.
    public var seenPeopleSearch: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenPeopleSearchCount`.
    public var seenPeopleSearchCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dismissedScrollSearchTooltipCount`.
    public var dismissedScrollSearchTooltipCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/lastDismissedScrollSearchTooltipTimestamp`.
    public var lastDismissedScrollSearchTooltipTimestamp: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/hasUsedQuickswitcherShortcut`.
    public var hasUsedQuickswitcherShortcut: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenQuickswitcherShortcutTipCount`.
    public var seenQuickswitcherShortcutTipCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/browsersDismissedChannelsLowResultsEducation`.
    public var browsersDismissedChannelsLowResultsEducation: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/browsersSeenInitialChannelsEducation`.
    public var browsersSeenInitialChannelsEducation: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/browsersDismissedPeopleLowResultsEducation`.
    public var browsersDismissedPeopleLowResultsEducation: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/browsersSeenInitialPeopleEducation`.
    public var browsersSeenInitialPeopleEducation: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/browsersDismissedUserGroupsLowResultsEducation`.
    public var browsersDismissedUserGroupsLowResultsEducation: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/browsersSeenInitialUserGroupsEducation`.
    public var browsersSeenInitialUserGroupsEducation: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/browsersDismissedFilesLowResultsEducation`.
    public var browsersDismissedFilesLowResultsEducation: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/browsersSeenInitialFilesEducation`.
    public var browsersSeenInitialFilesEducation: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/browsersDismissedInitialDraftsEducation`.
    public var browsersDismissedInitialDraftsEducation: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/browsersSeenInitialDraftsEducation`.
    public var browsersSeenInitialDraftsEducation: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/browsersDismissedInitialActivityEducation`.
    public var browsersDismissedInitialActivityEducation: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/browsersSeenInitialActivityEducation`.
    public var browsersSeenInitialActivityEducation: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/browsersDismissedInitialSavedEducation`.
    public var browsersDismissedInitialSavedEducation: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/browsersSeenInitialSavedEducation`.
    public var browsersSeenInitialSavedEducation: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenEditMode`.
    public var seenEditMode: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenEditModeEdu`.
    public var seenEditModeEdu: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/xwsDismissedEducation`.
    public var xwsDismissedEducation: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/xwsSeenEducation`.
    public var xwsSeenEducation: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/sidebarPrefDismissedTip`.
    public var sidebarPrefDismissedTip: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/a11yDyslexic`.
    public var a11yDyslexic: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/a11yAnimations`.
    public var a11yAnimations: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenKeyboardShortcutsCoachmark`.
    public var seenKeyboardShortcutsCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/needsInitialPasswordSet`.
    public var needsInitialPasswordSet: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/lessonsEnabled`.
    public var lessonsEnabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/tractorEnabled`.
    public var tractorEnabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/tractorExperimentGroup`.
    public var tractorExperimentGroup: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/openedSlackbotDm`.
    public var openedSlackbotDm: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/newxpSeenHelpMessage`.
    public var newxpSeenHelpMessage: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/newxpSuggestedChannels`.
    public var newxpSuggestedChannels: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/onboardingComplete`.
    public var onboardingComplete: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/welcomePlaceState`.
    public var welcomePlaceState: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/hasReceivedThreadedMessage`.
    public var hasReceivedThreadedMessage: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/joinerNotificationsMuted`.
    public var joinerNotificationsMuted: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/inviteAcceptedNotificationsMuted`.
    public var inviteAcceptedNotificationsMuted: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/joinerMessageSuggestionDismissed`.
    public var joinerMessageSuggestionDismissed: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dismissedFullscreenDownloadSsbPrompt`.
    public var dismissedFullscreenDownloadSsbPrompt: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dismissedBannerDownloadSsbPrompt`.
    public var dismissedBannerDownloadSsbPrompt: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/onboardingState`.
    public var onboardingState: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/whocanseethisDmMpdmBadge`.
    public var whocanseethisDmMpdmBadge: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/highlightWords`.
    public var highlightWords: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/threadsEverything`.
    public var threadsEverything: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/noTextInNotifications`.
    public var noTextInNotifications: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/pushShowPreview`.
    public var pushShowPreview: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/growlsEnabled`.
    public var growlsEnabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/allChannelsLoud`.
    public var allChannelsLoud: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/pushDmAlert`.
    public var pushDmAlert: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/pushMentionAlert`.
    public var pushMentionAlert: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/pushEverything`.
    public var pushEverything: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/pushIdleWait`.
    public var pushIdleWait: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/pushSound`.
    public var pushSound: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/newMsgSnd`.
    public var newMsgSnd: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/huddleInviteSound`.
    public var huddleInviteSound: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/pushLoudChannels`.
    public var pushLoudChannels: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/pushMentionChannels`.
    public var pushMentionChannels: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/pushLoudChannelsSet`.
    public var pushLoudChannelsSet: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/loudChannels`.
    public var loudChannels: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/neverChannels`.
    public var neverChannels: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/loudChannelsSet`.
    public var loudChannelsSet: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/atChannelSuppressedChannels`.
    public var atChannelSuppressedChannels: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/pushAtChannelSuppressedChannels`.
    public var pushAtChannelSuppressedChannels: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/mutedChannels`.
    public var mutedChannels: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/allNotificationsPrefs`.
    public var allNotificationsPrefs: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/growthMsgLimitApproachingCtaCount`.
    public var growthMsgLimitApproachingCtaCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/growthMsgLimitApproachingCtaTs`.
    public var growthMsgLimitApproachingCtaTs: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/growthMsgLimitReachedCtaCount`.
    public var growthMsgLimitReachedCtaCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/growthMsgLimitReachedCtaLastTs`.
    public var growthMsgLimitReachedCtaLastTs: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/growthMsgLimitLongReachedCtaCount`.
    public var growthMsgLimitLongReachedCtaCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/growthMsgLimitLongReachedCtaLastTs`.
    public var growthMsgLimitLongReachedCtaLastTs: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/growthMsgLimitSixtyDayBannerCtaCount`.
    public var growthMsgLimitSixtyDayBannerCtaCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/growthMsgLimitSixtyDayBannerCtaLastTs`.
    public var growthMsgLimitSixtyDayBannerCtaLastTs: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/growthAllBannersPrefs`.
    public var growthAllBannersPrefs: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/analyticsUpsellCoachmarkSeen`.
    public var analyticsUpsellCoachmarkSeen: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenAppSpaceCoachmark`.
    public var seenAppSpaceCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenAppSpaceTutorial`.
    public var seenAppSpaceTutorial: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dismissedAppLauncherWelcome`.
    public var dismissedAppLauncherWelcome: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dismissedAppLauncherLimit`.
    public var dismissedAppLauncherLimit: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dismissedAppLauncherAtlassianPromo`.
    public var dismissedAppLauncherAtlassianPromo: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enableAppConfigRedesign`.
    public var enableAppConfigRedesign: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dismissedAppConfigRedesignCoachmark`.
    public var dismissedAppConfigRedesignCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dismissedAppManifestDescription`.
    public var dismissedAppManifestDescription: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dismissedAppManifestCoachmark`.
    public var dismissedAppManifestCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenChannelEmailTooltip`.
    public var seenChannelEmailTooltip: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/showEntOnboarding`.
    public var showEntOnboarding: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/foldersEnabled`.
    public var foldersEnabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/folderData`.
    public var folderData: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenCorporateExportAlert`.
    public var seenCorporateExportAlert: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/showAutocompleteHelp`.
    public var showAutocompleteHelp: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/deprecationToastLastSeen`.
    public var deprecationToastLastSeen: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/deprecationModalLastSeen`.
    public var deprecationModalLastSeen: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/deprecationBannerLastSeen`.
    public var deprecationBannerLastSeen: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/iap1Lab`.
    public var iap1Lab: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/iaTopNavTheme`.
    public var iaTopNavTheme: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/iaPlatformActionsLab`.
    public var iaPlatformActionsLab: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/activityView`.
    public var activityView: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/savedView`.
    public var savedView: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenFloatingSidebarCoachmark`.
    public var seenFloatingSidebarCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/desktopClientIds`.
    public var desktopClientIds: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/failoverProxyCheckCompleted`.
    public var failoverProxyCheckCompleted: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/chimeAccessCheckCompleted`.
    public var chimeAccessCheckCompleted: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/mxCalendarType`.
    public var mxCalendarType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/edgeUploadProxyCheckCompleted`.
    public var edgeUploadProxyCheckCompleted: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/appSubdomainCheckCompleted`.
    public var appSubdomainCheckCompleted: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/addPromptInteracted`.
    public var addPromptInteracted: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/addAppsPromptDismissed`.
    public var addAppsPromptDismissed: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/addChannelPromptDismissed`.
    public var addChannelPromptDismissed: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/channelSidebarHideInvite`.
    public var channelSidebarHideInvite: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/channelSidebarHideBrowseDmsLink`.
    public var channelSidebarHideBrowseDmsLink: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/inProdSurveysEnabled`.
    public var inProdSurveysEnabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/connectDmEarlyAccess`.
    public var connectDmEarlyAccess: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dismissedInstalledAppDmSuggestions`.
    public var dismissedInstalledAppDmSuggestions: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenContextualMessageShortcutsModal`.
    public var seenContextualMessageShortcutsModal: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenMessageNavigationEducationalToast`.
    public var seenMessageNavigationEducationalToast: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/contextualMessageShortcutsModalWasSeen`.
    public var contextualMessageShortcutsModalWasSeen: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/messageNavigationToastWasSeen`.
    public var messageNavigationToastWasSeen: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/upToBrowseKbShortcut`.
    public var upToBrowseKbShortcut: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/setA11yPrefsNewUser`.
    public var setA11yPrefsNewUser: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/a11yPlaySoundForIncomingDm`.
    public var a11yPlaySoundForIncomingDm: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/a11yPlaySoundForSentDm`.
    public var a11yPlaySoundForSentDm: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/a11yReadOutIncomingDm`.
    public var a11yReadOutIncomingDm: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/a11yScreenReaderMessageLabelDateTimeFirst`.
    public var a11yScreenReaderMessageLabelDateTimeFirst: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/shouldShowContextualHelpForConversationNavigation`.
    public var shouldShowContextualHelpForConversationNavigation: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/shouldShowContextualHelpForJumpToConversation`.
    public var shouldShowContextualHelpForJumpToConversation: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/shouldShowContextualHelpForSectionNavigation`.
    public var shouldShowContextualHelpForSectionNavigation: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/shouldShowContextualHelpForThreadNavigation`.
    public var shouldShowContextualHelpForThreadNavigation: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/shouldShowUnsendMessageConfirmation`.
    public var shouldShowUnsendMessageConfirmation: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/channelSections`.
    public var channelSections: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/showQuickReactions`.
    public var showQuickReactions: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/userCustomizedQuickReactionsDisplayFeature`.
    public var userCustomizedQuickReactionsDisplayFeature: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/userCustomizedQuickReactionsHasCustomized`.
    public var userCustomizedQuickReactionsHasCustomized: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/userCustomizedQuickReactionsUseFrequentlyUsedEmoji`.
    public var userCustomizedQuickReactionsUseFrequentlyUsedEmoji: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/reactionNotifications`.
    public var reactionNotifications: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/hasReceivedMentionOrReaction`.
    public var hasReceivedMentionOrReaction: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/hasStarredItem`.
    public var hasStarredItem: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/hasDraftedMessage`.
    public var hasDraftedMessage: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enableMentionsAndReactionsView`.
    public var enableMentionsAndReactionsView: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enableRemindersView`.
    public var enableRemindersView: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enableSavedItemsView`.
    public var enableSavedItemsView: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enableHqView`.
    public var enableHqView: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enableAllDmsView`.
    public var enableAllDmsView: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enableChannelBrowserView`.
    public var enableChannelBrowserView: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enableFileBrowserView`.
    public var enableFileBrowserView: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enablePeopleBrowserView`.
    public var enablePeopleBrowserView: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enableAppBrowserView`.
    public var enableAppBrowserView: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/reachedAllDmsDisclosure`.
    public var reachedAllDmsDisclosure: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enableSlackConnectView`.
    public var enableSlackConnectView: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enableSlackConnectView2`.
    public var enableSlackConnectView2: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/hasAcknowledgedShortcutSpeedbump`.
    public var hasAcknowledgedShortcutSpeedbump: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enableMediaCaptions`.
    public var enableMediaCaptions: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/mediaPlaybackSpeed`.
    public var mediaPlaybackSpeed: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/mediaMuted`.
    public var mediaMuted: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/mediaVolume`.
    public var mediaVolume: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dismissedConnectAutoApprovalModal`.
    public var dismissedConnectAutoApprovalModal: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/tasksView`.
    public var tasksView: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/showSidebarAvatars`.
    public var showSidebarAvatars: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/hasDismissedGoogleDirectoryCoachmark`.
    public var hasDismissedGoogleDirectoryCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenScPageBanner`.
    public var seenScPageBanner: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenScMenuCoachmark`.
    public var seenScMenuCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenScPage`.
    public var seenScPage: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dismissedScdmEducation`.
    public var dismissedScdmEducation: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenBookmarksIntro`.
    public var seenBookmarksIntro: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/scdmTrialOfferBanner`.
    public var scdmTrialOfferBanner: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/identityLinksPrefs`.
    public var identityLinksPrefs: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/identityLinksGlobalPrefs`.
    public var identityLinksGlobalPrefs: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenSectionsUnreadsOnlyPromptCount`.
    public var seenSectionsUnreadsOnlyPromptCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/lastSeenSectionsUnreadsOnlyPromptTimestamp`.
    public var lastSeenSectionsUnreadsOnlyPromptTimestamp: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/notificationsView`.
    public var notificationsView: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/progressiveDisclosureState`.
    public var progressiveDisclosureState: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/suggestionsRequestId`.
    public var suggestionsRequestId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/allowedUnfurlSenders`.
    public var allowedUnfurlSenders: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/iaDetailsCoachmarkSeen`.
    public var iaDetailsCoachmarkSeen: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/hideExternalMembersSharingSpeedBump`.
    public var hideExternalMembersSharingSpeedBump: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/whoCanShareContactCard`.
    public var whoCanShareContactCard: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/slackConnectInviteShouldBadgeSidebar`.
    public var slackConnectInviteShouldBadgeSidebar: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/phcDismissed`.
    public var phcDismissed: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dismissedGovSlackFirstTimePopup`.
    public var dismissedGovSlackFirstTimePopup: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/mobileChannelListSort`.
    public var mobileChannelListSort: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/userExpectationsSurveyLastTriggerAttempt`.
    public var userExpectationsSurveyLastTriggerAttempt: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/localesEnabled`.
    public var localesEnabled: SlackModels.LocalesEnabled?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/phcViewed`.
    public var phcViewed: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenA11yPrefSetupCoachmark`.
    public var seenA11yPrefSetupCoachmark: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enableFileBrowserViewForDocs`.
    public var enableFileBrowserViewForDocs: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enableShortcutsView`.
    public var enableShortcutsView: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/showGovSlackContextBarBanner`.
    public var showGovSlackContextBarBanner: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/whoCanSeeAccountBySearchingEmail`.
    public var whoCanSeeAccountBySearchingEmail: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/contextualHelpResetCount`.
    public var contextualHelpResetCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/mobileChannelListShowAllDms`.
    public var mobileChannelListShowAllDms: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enableQuipFileBrowserView`.
    public var enableQuipFileBrowserView: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/a11yPlaySoundForIncomingDmChoice`.
    public var a11yPlaySoundForIncomingDmChoice: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/a11yPlaySoundForSentDmChoice`.
    public var a11yPlaySoundForSentDmChoice: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/onboardingTipOptOut`.
    public var onboardingTipOptOut: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenOnboardingSynthView`.
    public var seenOnboardingSynthView: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enableDraftsView`.
    public var enableDraftsView: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enableScheduledView`.
    public var enableScheduledView: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenSentPageInSidebar`.
    public var seenSentPageInSidebar: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/firstSeenSentPageInSidebar`.
    public var firstSeenSentPageInSidebar: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenNewBadgeInMoreMenuSidebar`.
    public var seenNewBadgeInMoreMenuSidebar: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/firstSeenNewBadgeInMoreMenuSidebar`.
    public var firstSeenNewBadgeInMoreMenuSidebar: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenOnboardingSynthViewCount`.
    public var seenOnboardingSynthViewCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/synthViewPrefs`.
    public var synthViewPrefs: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/clipsFeedbackSurveyLastTriggerAttempt`.
    public var clipsFeedbackSurveyLastTriggerAttempt: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/enableLaterView`.
    public var enableLaterView: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/hasJoinedHuddle`.
    public var hasJoinedHuddle: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/hasSentTenMessages`.
    public var hasSentTenMessages: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/suppressThreadMentionWarning`.
    public var suppressThreadMentionWarning: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/hiddenUsers`.
    public var hiddenUsers: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/dismissedSentPageEducation`.
    public var dismissedSentPageEducation: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenOnboardingSynthViewV2`.
    public var seenOnboardingSynthViewV2: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/clickedCloseOnboardingSynthViewBanner`.
    public var clickedCloseOnboardingSynthViewBanner: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/seenOnboardingSynthViewCountV2`.
    public var seenOnboardingSynthViewCountV2: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/appManifestSchemaFormat`.
    public var appManifestSchemaFormat: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelfPrefs/channelCanvasVariant`.
    public var channelCanvasVariant: Swift.Int?
    /// Creates a new `SelfPrefs`.
    ///
    /// - Parameters:
    ///   - time24:
    ///   - jumbomoji:
    ///   - locale:
    ///   - purchaser:
    ///   - tz:
    ///   - frecency:
    ///   - underlineLinks:
    ///   - userColors:
    ///   - colorNamesInList:
    ///   - emailAlerts:
    ///   - emailAlertsSleepUntil:
    ///   - emailTips:
    ///   - emailWeekly:
    ///   - emailOffers:
    ///   - emailResearch:
    ///   - emailDeveloper:
    ///   - welcomeMessageHidden:
    ///   - searchSort:
    ///   - searchFileSort:
    ///   - searchChannelSort:
    ///   - searchPeopleSort:
    ///   - expandInlineImgs:
    ///   - expandInternalInlineImgs:
    ///   - expandSnippets:
    ///   - postsFormattingGuide:
    ///   - seenWelcome2:
    ///   - seenSsbPrompt:
    ///   - spacesNewXpBannerDismissed:
    ///   - searchOnlyMyChannels:
    ///   - searchOnlyCurrentTeam:
    ///   - searchHideMyChannels:
    ///   - searchOnlyShowOnline:
    ///   - searchHideDeactivatedUsers:
    ///   - emojiMode:
    ///   - emojiUse:
    ///   - emojiUseOrg:
    ///   - hasInvited:
    ///   - hasUploaded:
    ///   - hasCreatedChannel:
    ///   - hasCreatedChannelSection:
    ///   - hasSearched:
    ///   - searchExcludeChannels:
    ///   - messagesTheme:
    ///   - webappSpellcheck:
    ///   - noJoinedOverlays:
    ///   - noCreatedOverlays:
    ///   - dropboxEnabled:
    ///   - seenDomainInviteReminder:
    ///   - seenMemberInviteReminder:
    ///   - muteSounds:
    ///   - arrowHistory:
    ///   - tabUiReturnSelects:
    ///   - obeyInlineImgLimit:
    ///   - requireAt:
    ///   - ssbSpaceWindow:
    ///   - macSsbBounce:
    ///   - macSsbBullet:
    ///   - expandNonMediaAttachments:
    ///   - showTyping:
    ///   - pagekeysHandled:
    ///   - lastSnippetType:
    ///   - displayRealNamesOverride:
    ///   - displayDisplayNames:
    ///   - enterIsSpecialInTbt:
    ///   - msgInputSendBtn:
    ///   - msgInputSendBtnAutoSet:
    ///   - msgInputStickyComposer:
    ///   - composerNux:
    ///   - graphicEmoticons:
    ///   - convertEmoticons:
    ///   - ssEmojis:
    ///   - seenOnboardingStart:
    ///   - onboardingCancelled:
    ///   - seenOnboardingSlackbotConversation:
    ///   - seenOnboardingChannels:
    ///   - seenOnboardingDirectMessages:
    ///   - seenOnboardingInvites:
    ///   - seenOnboardingSearch:
    ///   - seenOnboardingRecentMentions:
    ///   - seenOnboardingStarredItems:
    ///   - seenOnboardingPrivateGroups:
    ///   - seenOnboardingBanner:
    ///   - onboardingSlackbotConversationStep:
    ///   - setTzAutomatically:
    ///   - suppressLinkWarning:
    ///   - suppressExternalInvitesFromComposeWarning:
    ///   - seenEmojiPackCta:
    ///   - seenEmojiPackDialog:
    ///   - seenScheduleSendCoachmark:
    ///   - emojiPacksMostRecentAvailableTime:
    ///   - emojiPacksClickedPickerCta:
    ///   - emojiPacksClickedPickerPostInstallCta:
    ///   - emojiPacksClickedCollectionCta:
    ///   - dndEnabled:
    ///   - dndStartHour:
    ///   - dndEndHour:
    ///   - dndBeforeMonday:
    ///   - dndAfterMonday:
    ///   - dndEnabledMonday:
    ///   - dndBeforeTuesday:
    ///   - dndAfterTuesday:
    ///   - dndEnabledTuesday:
    ///   - dndBeforeWednesday:
    ///   - dndAfterWednesday:
    ///   - dndEnabledWednesday:
    ///   - dndBeforeThursday:
    ///   - dndAfterThursday:
    ///   - dndEnabledThursday:
    ///   - dndBeforeFriday:
    ///   - dndAfterFriday:
    ///   - dndEnabledFriday:
    ///   - dndBeforeSaturday:
    ///   - dndAfterSaturday:
    ///   - dndEnabledSaturday:
    ///   - dndBeforeSunday:
    ///   - dndAfterSunday:
    ///   - dndEnabledSunday:
    ///   - dndDays:
    ///   - dndWeekdaysOffAllday:
    ///   - reminderNotificationTime:
    ///   - dndCustomNewBadgeSeen:
    ///   - dndNotificationScheduleNewBadgeSeen:
    ///   - notificationCenterFilters:
    ///   - callsSurveyLastSeen:
    ///   - huddleSurveyLastSeen:
    ///   - sidebarBehavior:
    ///   - channelSort:
    ///   - separatePrivateChannels:
    ///   - separateSharedChannels:
    ///   - sidebarTheme:
    ///   - sidebarThemeCustomValues:
    ///   - noInvitesWidgetInSidebar:
    ///   - noOmniboxInChannels:
    ///   - kKeyOmniboxAutoHideCount:
    ///   - showSidebarQuickswitcherButton:
    ///   - entOrgWideChannelsSidebar:
    ///   - markMsgsReadImmediately:
    ///   - startScrollAtOldest:
    ///   - snippetEditorWrapLongLines:
    ///   - lsDisabled:
    ///   - fKeySearch:
    ///   - kKeyOmnibox:
    ///   - promptedForEmailDisabling:
    ///   - noMacelectronBanner:
    ///   - noMacssb1Banner:
    ///   - noMacssb2Banner:
    ///   - noWinssb1Banner:
    ///   - hideUserGroupInfoPane:
    ///   - mentionsExcludeAtUserGroups:
    ///   - mentionsExcludeReactions:
    ///   - privacyPolicySeen:
    ///   - enterpriseMigrationSeen:
    ///   - searchExcludeBots:
    ///   - loadLato2:
    ///   - fullerTimestamps:
    ///   - lastSeenAtChannelWarning:
    ///   - emojiAutocompleteBig:
    ///   - twoFactorAuthEnabled:
    ///   - hideHexSwatch:
    ///   - showJumperScores:
    ///   - enterpriseMdmCustomMsg:
    ///   - clientLogsPri:
    ///   - flannelServerPool:
    ///   - mentionsExcludeAtChannels:
    ///   - confirmClearAllUnreads:
    ///   - confirmUserMarkedAway:
    ///   - boxEnabled:
    ///   - seenSingleEmojiMsg:
    ///   - confirmShCallStart:
    ///   - preferredSkinTone:
    ///   - showAllSkinTones:
    ///   - whatsNewRead:
    ///   - helpModalOpenTimestamp:
    ///   - helpModalConsultBannerDismissed:
    ///   - helpFlexpaneSlackConnectCardSeen:
    ///   - helpFlexpaneClipsCardSeen:
    ///   - helpMenuOpenTimestamp:
    ///   - frecencyJumper:
    ///   - frecencyEntJumper:
    ///   - newxpSeenLastMessage:
    ///   - showMemoryInstrument:
    ///   - enableUnreadView:
    ///   - seenUnreadViewCoachmark:
    ///   - seenConnectDmCoachmark:
    ///   - seenConnectSectionCoachmark:
    ///   - shouldShowConnectSection:
    ///   - enableReactEmojiPicker:
    ///   - seenCustomStatusBadge:
    ///   - seenCustomStatusCallout:
    ///   - seenCustomStatusExpirationBadge:
    ///   - usedCustomStatusKbShortcut:
    ///   - seenGuestAdminSlackbotAnnouncement:
    ///   - seenThreadsNotificationBanner:
    ///   - seenNameTaggingCoachmark:
    ///   - allUnreadsSortOrder:
    ///   - allUnreadsSectionFilter:
    ///   - seenIntlChannelNamesCoachmark:
    ///   - seenP3LocaleChangeMessageKoKr:
    ///   - seenToastNewLocaleLaunch:
    ///   - seenToastNewLocaleLaunchTs:
    ///   - seenLocaleChangeMessage:
    ///   - seenJapaneseLocaleChangeMessage:
    ///   - seenSharedChannelsCoachmark:
    ///   - seenSharedChannelsOptInChangeMessage:
    ///   - hasRecentlySharedAChannel:
    ///   - seenChannelBrowserAdminCoachmark:
    ///   - seenAdministrationMenu:
    ///   - seenDraftsSectionCoachmark:
    ///   - seenEmojiUpdateOverlayCoachmark:
    ///   - seenSonicDeluxeToast:
    ///   - seenWysiwygDeluxeToast:
    ///   - seenMarkdownPasteToast:
    ///   - seenMarkdownPasteShortcut:
    ///   - seenIaEducation:
    ///   - showIaTourRelaunch:
    ///   - plainTextMode:
    ///   - showSharedChannelsEducationBanner:
    ///   - iaSlackbotSurveyTimestamp48h:
    ///   - iaSlackbotSurveyTimestamp7d:
    ///   - enableStreamlineView:
    ///   - enableSentView:
    ///   - allowCallsToSetCurrentStatus:
    ///   - inInteractiveMasMigrationFlow:
    ///   - sunsetInteractiveMessageViews:
    ///   - shdepPromoCodeSubmitted:
    ///   - seenShdepSlackbotMessage:
    ///   - seenCallsInteractiveCoachmark:
    ///   - allowCmdTabIss:
    ///   - joinCallsDeviceSettings:
    ///   - callsDisconnectOnLock:
    ///   - seenWorkflowBuilderDeluxeToast:
    ///   - workflowBuilderIntroModalClickedThrough:
    ///   - workflowBuilderCoachmarks:
    ///   - seenGdriveCoachmark:
    ///   - seenFirstInstallCoachmark:
    ///   - seenExistingInstallCoachmark:
    ///   - seenLinkUnfurlCoachmark:
    ///   - filePickerVariant:
    ///   - openQuipDocInFlexpane:
    ///   - savedSearches:
    ///   - huddlesVariant:
    ///   - huddlesCcByDefault:
    ///   - huddlesMuteByDefault:
    ///   - huddlesGlobalMute:
    ///   - huddlesMiniPanel:
    ///   - huddlesSetStatus:
    ///   - huddlesShowShoutyRooster:
    ///   - huddlesDisconnectOnLock:
    ///   - huddlesPlayMusicWhenLast:
    ///   - huddlesAllowSmartNotif:
    ///   - huddlesReactionsPlaySound:
    ///   - huddlesReactionsReadOutLoud:
    ///   - huddlesChimeNewEndpointsCheckCompleted:
    ///   - xwsSidebarVariant:
    ///   - inboxViewsWorkspaceFilter:
    ///   - overloadedMessageEnabled:
    ///   - seenHighlightsCoachmark:
    ///   - seenHighlightsArrowsCoachmark:
    ///   - seenHighlightsWarmWelcome:
    ///   - seenNewSearchUi:
    ///   - seenChannelSearch:
    ///   - seenPeopleSearch:
    ///   - seenPeopleSearchCount:
    ///   - dismissedScrollSearchTooltipCount:
    ///   - lastDismissedScrollSearchTooltipTimestamp:
    ///   - hasUsedQuickswitcherShortcut:
    ///   - seenQuickswitcherShortcutTipCount:
    ///   - browsersDismissedChannelsLowResultsEducation:
    ///   - browsersSeenInitialChannelsEducation:
    ///   - browsersDismissedPeopleLowResultsEducation:
    ///   - browsersSeenInitialPeopleEducation:
    ///   - browsersDismissedUserGroupsLowResultsEducation:
    ///   - browsersSeenInitialUserGroupsEducation:
    ///   - browsersDismissedFilesLowResultsEducation:
    ///   - browsersSeenInitialFilesEducation:
    ///   - browsersDismissedInitialDraftsEducation:
    ///   - browsersSeenInitialDraftsEducation:
    ///   - browsersDismissedInitialActivityEducation:
    ///   - browsersSeenInitialActivityEducation:
    ///   - browsersDismissedInitialSavedEducation:
    ///   - browsersSeenInitialSavedEducation:
    ///   - seenEditMode:
    ///   - seenEditModeEdu:
    ///   - xwsDismissedEducation:
    ///   - xwsSeenEducation:
    ///   - sidebarPrefDismissedTip:
    ///   - a11yDyslexic:
    ///   - a11yAnimations:
    ///   - seenKeyboardShortcutsCoachmark:
    ///   - needsInitialPasswordSet:
    ///   - lessonsEnabled:
    ///   - tractorEnabled:
    ///   - tractorExperimentGroup:
    ///   - openedSlackbotDm:
    ///   - newxpSeenHelpMessage:
    ///   - newxpSuggestedChannels:
    ///   - onboardingComplete:
    ///   - welcomePlaceState:
    ///   - hasReceivedThreadedMessage:
    ///   - joinerNotificationsMuted:
    ///   - inviteAcceptedNotificationsMuted:
    ///   - joinerMessageSuggestionDismissed:
    ///   - dismissedFullscreenDownloadSsbPrompt:
    ///   - dismissedBannerDownloadSsbPrompt:
    ///   - onboardingState:
    ///   - whocanseethisDmMpdmBadge:
    ///   - highlightWords:
    ///   - threadsEverything:
    ///   - noTextInNotifications:
    ///   - pushShowPreview:
    ///   - growlsEnabled:
    ///   - allChannelsLoud:
    ///   - pushDmAlert:
    ///   - pushMentionAlert:
    ///   - pushEverything:
    ///   - pushIdleWait:
    ///   - pushSound:
    ///   - newMsgSnd:
    ///   - huddleInviteSound:
    ///   - pushLoudChannels:
    ///   - pushMentionChannels:
    ///   - pushLoudChannelsSet:
    ///   - loudChannels:
    ///   - neverChannels:
    ///   - loudChannelsSet:
    ///   - atChannelSuppressedChannels:
    ///   - pushAtChannelSuppressedChannels:
    ///   - mutedChannels:
    ///   - allNotificationsPrefs:
    ///   - growthMsgLimitApproachingCtaCount:
    ///   - growthMsgLimitApproachingCtaTs:
    ///   - growthMsgLimitReachedCtaCount:
    ///   - growthMsgLimitReachedCtaLastTs:
    ///   - growthMsgLimitLongReachedCtaCount:
    ///   - growthMsgLimitLongReachedCtaLastTs:
    ///   - growthMsgLimitSixtyDayBannerCtaCount:
    ///   - growthMsgLimitSixtyDayBannerCtaLastTs:
    ///   - growthAllBannersPrefs:
    ///   - analyticsUpsellCoachmarkSeen:
    ///   - seenAppSpaceCoachmark:
    ///   - seenAppSpaceTutorial:
    ///   - dismissedAppLauncherWelcome:
    ///   - dismissedAppLauncherLimit:
    ///   - dismissedAppLauncherAtlassianPromo:
    ///   - enableAppConfigRedesign:
    ///   - dismissedAppConfigRedesignCoachmark:
    ///   - dismissedAppManifestDescription:
    ///   - dismissedAppManifestCoachmark:
    ///   - seenChannelEmailTooltip:
    ///   - showEntOnboarding:
    ///   - foldersEnabled:
    ///   - folderData:
    ///   - seenCorporateExportAlert:
    ///   - showAutocompleteHelp:
    ///   - deprecationToastLastSeen:
    ///   - deprecationModalLastSeen:
    ///   - deprecationBannerLastSeen:
    ///   - iap1Lab:
    ///   - iaTopNavTheme:
    ///   - iaPlatformActionsLab:
    ///   - activityView:
    ///   - savedView:
    ///   - seenFloatingSidebarCoachmark:
    ///   - desktopClientIds:
    ///   - failoverProxyCheckCompleted:
    ///   - chimeAccessCheckCompleted:
    ///   - mxCalendarType:
    ///   - edgeUploadProxyCheckCompleted:
    ///   - appSubdomainCheckCompleted:
    ///   - addPromptInteracted:
    ///   - addAppsPromptDismissed:
    ///   - addChannelPromptDismissed:
    ///   - channelSidebarHideInvite:
    ///   - channelSidebarHideBrowseDmsLink:
    ///   - inProdSurveysEnabled:
    ///   - connectDmEarlyAccess:
    ///   - dismissedInstalledAppDmSuggestions:
    ///   - seenContextualMessageShortcutsModal:
    ///   - seenMessageNavigationEducationalToast:
    ///   - contextualMessageShortcutsModalWasSeen:
    ///   - messageNavigationToastWasSeen:
    ///   - upToBrowseKbShortcut:
    ///   - setA11yPrefsNewUser:
    ///   - a11yPlaySoundForIncomingDm:
    ///   - a11yPlaySoundForSentDm:
    ///   - a11yReadOutIncomingDm:
    ///   - a11yScreenReaderMessageLabelDateTimeFirst:
    ///   - shouldShowContextualHelpForConversationNavigation:
    ///   - shouldShowContextualHelpForJumpToConversation:
    ///   - shouldShowContextualHelpForSectionNavigation:
    ///   - shouldShowContextualHelpForThreadNavigation:
    ///   - shouldShowUnsendMessageConfirmation:
    ///   - channelSections:
    ///   - showQuickReactions:
    ///   - userCustomizedQuickReactionsDisplayFeature:
    ///   - userCustomizedQuickReactionsHasCustomized:
    ///   - userCustomizedQuickReactionsUseFrequentlyUsedEmoji:
    ///   - reactionNotifications:
    ///   - hasReceivedMentionOrReaction:
    ///   - hasStarredItem:
    ///   - hasDraftedMessage:
    ///   - enableMentionsAndReactionsView:
    ///   - enableRemindersView:
    ///   - enableSavedItemsView:
    ///   - enableHqView:
    ///   - enableAllDmsView:
    ///   - enableChannelBrowserView:
    ///   - enableFileBrowserView:
    ///   - enablePeopleBrowserView:
    ///   - enableAppBrowserView:
    ///   - reachedAllDmsDisclosure:
    ///   - enableSlackConnectView:
    ///   - enableSlackConnectView2:
    ///   - hasAcknowledgedShortcutSpeedbump:
    ///   - enableMediaCaptions:
    ///   - mediaPlaybackSpeed:
    ///   - mediaMuted:
    ///   - mediaVolume:
    ///   - dismissedConnectAutoApprovalModal:
    ///   - tasksView:
    ///   - showSidebarAvatars:
    ///   - hasDismissedGoogleDirectoryCoachmark:
    ///   - seenScPageBanner:
    ///   - seenScMenuCoachmark:
    ///   - seenScPage:
    ///   - dismissedScdmEducation:
    ///   - seenBookmarksIntro:
    ///   - scdmTrialOfferBanner:
    ///   - identityLinksPrefs:
    ///   - identityLinksGlobalPrefs:
    ///   - seenSectionsUnreadsOnlyPromptCount:
    ///   - lastSeenSectionsUnreadsOnlyPromptTimestamp:
    ///   - notificationsView:
    ///   - progressiveDisclosureState:
    ///   - suggestionsRequestId:
    ///   - allowedUnfurlSenders:
    ///   - iaDetailsCoachmarkSeen:
    ///   - hideExternalMembersSharingSpeedBump:
    ///   - whoCanShareContactCard:
    ///   - slackConnectInviteShouldBadgeSidebar:
    ///   - phcDismissed:
    ///   - dismissedGovSlackFirstTimePopup:
    ///   - mobileChannelListSort:
    ///   - userExpectationsSurveyLastTriggerAttempt:
    ///   - localesEnabled:
    ///   - phcViewed:
    ///   - seenA11yPrefSetupCoachmark:
    ///   - enableFileBrowserViewForDocs:
    ///   - enableShortcutsView:
    ///   - showGovSlackContextBarBanner:
    ///   - whoCanSeeAccountBySearchingEmail:
    ///   - contextualHelpResetCount:
    ///   - mobileChannelListShowAllDms:
    ///   - enableQuipFileBrowserView:
    ///   - a11yPlaySoundForIncomingDmChoice:
    ///   - a11yPlaySoundForSentDmChoice:
    ///   - onboardingTipOptOut:
    ///   - seenOnboardingSynthView:
    ///   - enableDraftsView:
    ///   - enableScheduledView:
    ///   - seenSentPageInSidebar:
    ///   - firstSeenSentPageInSidebar:
    ///   - seenNewBadgeInMoreMenuSidebar:
    ///   - firstSeenNewBadgeInMoreMenuSidebar:
    ///   - seenOnboardingSynthViewCount:
    ///   - synthViewPrefs:
    ///   - clipsFeedbackSurveyLastTriggerAttempt:
    ///   - enableLaterView:
    ///   - hasJoinedHuddle:
    ///   - hasSentTenMessages:
    ///   - suppressThreadMentionWarning:
    ///   - hiddenUsers:
    ///   - dismissedSentPageEducation:
    ///   - seenOnboardingSynthViewV2:
    ///   - clickedCloseOnboardingSynthViewBanner:
    ///   - seenOnboardingSynthViewCountV2:
    ///   - appManifestSchemaFormat:
    ///   - channelCanvasVariant:
    public init(
        time24: Swift.Bool? = nil,
        jumbomoji: Swift.Bool? = nil,
        locale: Swift.String? = nil,
        purchaser: Swift.Bool? = nil,
        tz: Swift.String? = nil,
        frecency: Swift.String? = nil,
        underlineLinks: Swift.Bool? = nil,
        userColors: Swift.String? = nil,
        colorNamesInList: Swift.Bool? = nil,
        emailAlerts: Swift.String? = nil,
        emailAlertsSleepUntil: Swift.Int? = nil,
        emailTips: Swift.Bool? = nil,
        emailWeekly: Swift.Bool? = nil,
        emailOffers: Swift.Bool? = nil,
        emailResearch: Swift.Bool? = nil,
        emailDeveloper: Swift.Bool? = nil,
        welcomeMessageHidden: Swift.Bool? = nil,
        searchSort: Swift.String? = nil,
        searchFileSort: Swift.String? = nil,
        searchChannelSort: Swift.String? = nil,
        searchPeopleSort: Swift.String? = nil,
        expandInlineImgs: Swift.Bool? = nil,
        expandInternalInlineImgs: Swift.Bool? = nil,
        expandSnippets: Swift.Bool? = nil,
        postsFormattingGuide: Swift.Bool? = nil,
        seenWelcome2: Swift.Bool? = nil,
        seenSsbPrompt: Swift.Bool? = nil,
        spacesNewXpBannerDismissed: Swift.Bool? = nil,
        searchOnlyMyChannels: Swift.Bool? = nil,
        searchOnlyCurrentTeam: Swift.Bool? = nil,
        searchHideMyChannels: Swift.Bool? = nil,
        searchOnlyShowOnline: Swift.Bool? = nil,
        searchHideDeactivatedUsers: Swift.Bool? = nil,
        emojiMode: Swift.String? = nil,
        emojiUse: Swift.String? = nil,
        emojiUseOrg: Swift.String? = nil,
        hasInvited: Swift.Bool? = nil,
        hasUploaded: Swift.Bool? = nil,
        hasCreatedChannel: Swift.Bool? = nil,
        hasCreatedChannelSection: Swift.Bool? = nil,
        hasSearched: Swift.Bool? = nil,
        searchExcludeChannels: Swift.String? = nil,
        messagesTheme: Swift.String? = nil,
        webappSpellcheck: Swift.Bool? = nil,
        noJoinedOverlays: Swift.Bool? = nil,
        noCreatedOverlays: Swift.Bool? = nil,
        dropboxEnabled: Swift.Bool? = nil,
        seenDomainInviteReminder: Swift.Bool? = nil,
        seenMemberInviteReminder: Swift.Bool? = nil,
        muteSounds: Swift.Bool? = nil,
        arrowHistory: Swift.Bool? = nil,
        tabUiReturnSelects: Swift.Bool? = nil,
        obeyInlineImgLimit: Swift.Bool? = nil,
        requireAt: Swift.Bool? = nil,
        ssbSpaceWindow: Swift.String? = nil,
        macSsbBounce: Swift.String? = nil,
        macSsbBullet: Swift.Bool? = nil,
        expandNonMediaAttachments: Swift.Bool? = nil,
        showTyping: Swift.Bool? = nil,
        pagekeysHandled: Swift.Bool? = nil,
        lastSnippetType: Swift.String? = nil,
        displayRealNamesOverride: Swift.Int? = nil,
        displayDisplayNames: Swift.Bool? = nil,
        enterIsSpecialInTbt: Swift.Bool? = nil,
        msgInputSendBtn: Swift.Bool? = nil,
        msgInputSendBtnAutoSet: Swift.Bool? = nil,
        msgInputStickyComposer: Swift.Bool? = nil,
        composerNux: Swift.String? = nil,
        graphicEmoticons: Swift.Bool? = nil,
        convertEmoticons: Swift.Bool? = nil,
        ssEmojis: Swift.Bool? = nil,
        seenOnboardingStart: Swift.Bool? = nil,
        onboardingCancelled: Swift.Bool? = nil,
        seenOnboardingSlackbotConversation: Swift.Bool? = nil,
        seenOnboardingChannels: Swift.Bool? = nil,
        seenOnboardingDirectMessages: Swift.Bool? = nil,
        seenOnboardingInvites: Swift.Bool? = nil,
        seenOnboardingSearch: Swift.Bool? = nil,
        seenOnboardingRecentMentions: Swift.Bool? = nil,
        seenOnboardingStarredItems: Swift.Bool? = nil,
        seenOnboardingPrivateGroups: Swift.Bool? = nil,
        seenOnboardingBanner: Swift.Bool? = nil,
        onboardingSlackbotConversationStep: Swift.Int? = nil,
        setTzAutomatically: Swift.Bool? = nil,
        suppressLinkWarning: Swift.Bool? = nil,
        suppressExternalInvitesFromComposeWarning: Swift.Bool? = nil,
        seenEmojiPackCta: Swift.Int? = nil,
        seenEmojiPackDialog: Swift.Bool? = nil,
        seenScheduleSendCoachmark: Swift.Bool? = nil,
        emojiPacksMostRecentAvailableTime: Swift.Int? = nil,
        emojiPacksClickedPickerCta: Swift.Bool? = nil,
        emojiPacksClickedPickerPostInstallCta: Swift.Bool? = nil,
        emojiPacksClickedCollectionCta: Swift.Bool? = nil,
        dndEnabled: Swift.Bool? = nil,
        dndStartHour: Swift.String? = nil,
        dndEndHour: Swift.String? = nil,
        dndBeforeMonday: Swift.String? = nil,
        dndAfterMonday: Swift.String? = nil,
        dndEnabledMonday: Swift.String? = nil,
        dndBeforeTuesday: Swift.String? = nil,
        dndAfterTuesday: Swift.String? = nil,
        dndEnabledTuesday: Swift.String? = nil,
        dndBeforeWednesday: Swift.String? = nil,
        dndAfterWednesday: Swift.String? = nil,
        dndEnabledWednesday: Swift.String? = nil,
        dndBeforeThursday: Swift.String? = nil,
        dndAfterThursday: Swift.String? = nil,
        dndEnabledThursday: Swift.String? = nil,
        dndBeforeFriday: Swift.String? = nil,
        dndAfterFriday: Swift.String? = nil,
        dndEnabledFriday: Swift.String? = nil,
        dndBeforeSaturday: Swift.String? = nil,
        dndAfterSaturday: Swift.String? = nil,
        dndEnabledSaturday: Swift.String? = nil,
        dndBeforeSunday: Swift.String? = nil,
        dndAfterSunday: Swift.String? = nil,
        dndEnabledSunday: Swift.String? = nil,
        dndDays: Swift.String? = nil,
        dndWeekdaysOffAllday: Swift.Bool? = nil,
        reminderNotificationTime: Swift.String? = nil,
        dndCustomNewBadgeSeen: Swift.Bool? = nil,
        dndNotificationScheduleNewBadgeSeen: Swift.Bool? = nil,
        notificationCenterFilters: Swift.String? = nil,
        callsSurveyLastSeen: Swift.String? = nil,
        huddleSurveyLastSeen: Swift.String? = nil,
        sidebarBehavior: Swift.String? = nil,
        channelSort: Swift.String? = nil,
        separatePrivateChannels: Swift.Bool? = nil,
        separateSharedChannels: Swift.Bool? = nil,
        sidebarTheme: Swift.String? = nil,
        sidebarThemeCustomValues: Swift.String? = nil,
        noInvitesWidgetInSidebar: Swift.Bool? = nil,
        noOmniboxInChannels: Swift.Bool? = nil,
        kKeyOmniboxAutoHideCount: Swift.Int? = nil,
        showSidebarQuickswitcherButton: Swift.Bool? = nil,
        entOrgWideChannelsSidebar: Swift.Bool? = nil,
        markMsgsReadImmediately: Swift.Bool? = nil,
        startScrollAtOldest: Swift.Bool? = nil,
        snippetEditorWrapLongLines: Swift.Bool? = nil,
        lsDisabled: Swift.Bool? = nil,
        fKeySearch: Swift.Bool? = nil,
        kKeyOmnibox: Swift.Bool? = nil,
        promptedForEmailDisabling: Swift.Bool? = nil,
        noMacelectronBanner: Swift.Bool? = nil,
        noMacssb1Banner: Swift.Bool? = nil,
        noMacssb2Banner: Swift.Bool? = nil,
        noWinssb1Banner: Swift.Bool? = nil,
        hideUserGroupInfoPane: Swift.Bool? = nil,
        mentionsExcludeAtUserGroups: Swift.Bool? = nil,
        mentionsExcludeReactions: Swift.Bool? = nil,
        privacyPolicySeen: Swift.Bool? = nil,
        enterpriseMigrationSeen: Swift.Bool? = nil,
        searchExcludeBots: Swift.Bool? = nil,
        loadLato2: Swift.Bool? = nil,
        fullerTimestamps: Swift.Bool? = nil,
        lastSeenAtChannelWarning: Swift.Int? = nil,
        emojiAutocompleteBig: Swift.Bool? = nil,
        twoFactorAuthEnabled: Swift.Bool? = nil,
        hideHexSwatch: Swift.Bool? = nil,
        showJumperScores: Swift.Bool? = nil,
        enterpriseMdmCustomMsg: Swift.String? = nil,
        clientLogsPri: Swift.String? = nil,
        flannelServerPool: Swift.String? = nil,
        mentionsExcludeAtChannels: Swift.Bool? = nil,
        confirmClearAllUnreads: Swift.Bool? = nil,
        confirmUserMarkedAway: Swift.Bool? = nil,
        boxEnabled: Swift.Bool? = nil,
        seenSingleEmojiMsg: Swift.Bool? = nil,
        confirmShCallStart: Swift.Bool? = nil,
        preferredSkinTone: Swift.String? = nil,
        showAllSkinTones: Swift.Bool? = nil,
        whatsNewRead: Swift.Int? = nil,
        helpModalOpenTimestamp: Swift.Int? = nil,
        helpModalConsultBannerDismissed: Swift.Bool? = nil,
        helpFlexpaneSlackConnectCardSeen: Swift.Bool? = nil,
        helpFlexpaneClipsCardSeen: Swift.Bool? = nil,
        helpMenuOpenTimestamp: Swift.Int? = nil,
        frecencyJumper: Swift.String? = nil,
        frecencyEntJumper: Swift.String? = nil,
        newxpSeenLastMessage: Swift.Int? = nil,
        showMemoryInstrument: Swift.Bool? = nil,
        enableUnreadView: Swift.Bool? = nil,
        seenUnreadViewCoachmark: Swift.Bool? = nil,
        seenConnectDmCoachmark: Swift.Bool? = nil,
        seenConnectSectionCoachmark: Swift.Bool? = nil,
        shouldShowConnectSection: Swift.Bool? = nil,
        enableReactEmojiPicker: Swift.Bool? = nil,
        seenCustomStatusBadge: Swift.Bool? = nil,
        seenCustomStatusCallout: Swift.Bool? = nil,
        seenCustomStatusExpirationBadge: Swift.Bool? = nil,
        usedCustomStatusKbShortcut: Swift.Bool? = nil,
        seenGuestAdminSlackbotAnnouncement: Swift.Bool? = nil,
        seenThreadsNotificationBanner: Swift.Bool? = nil,
        seenNameTaggingCoachmark: Swift.Bool? = nil,
        allUnreadsSortOrder: Swift.String? = nil,
        allUnreadsSectionFilter: Swift.String? = nil,
        seenIntlChannelNamesCoachmark: Swift.Bool? = nil,
        seenP3LocaleChangeMessageKoKr: Swift.Int? = nil,
        seenToastNewLocaleLaunch: Swift.String? = nil,
        seenToastNewLocaleLaunchTs: Swift.Int? = nil,
        seenLocaleChangeMessage: Swift.Int? = nil,
        seenJapaneseLocaleChangeMessage: Swift.Bool? = nil,
        seenSharedChannelsCoachmark: Swift.Bool? = nil,
        seenSharedChannelsOptInChangeMessage: Swift.Bool? = nil,
        hasRecentlySharedAChannel: Swift.Bool? = nil,
        seenChannelBrowserAdminCoachmark: Swift.Bool? = nil,
        seenAdministrationMenu: Swift.Bool? = nil,
        seenDraftsSectionCoachmark: Swift.Bool? = nil,
        seenEmojiUpdateOverlayCoachmark: Swift.Bool? = nil,
        seenSonicDeluxeToast: Swift.Int? = nil,
        seenWysiwygDeluxeToast: Swift.Bool? = nil,
        seenMarkdownPasteToast: Swift.Int? = nil,
        seenMarkdownPasteShortcut: Swift.Int? = nil,
        seenIaEducation: Swift.Bool? = nil,
        showIaTourRelaunch: Swift.Int? = nil,
        plainTextMode: Swift.Bool? = nil,
        showSharedChannelsEducationBanner: Swift.Bool? = nil,
        iaSlackbotSurveyTimestamp48h: Swift.Int? = nil,
        iaSlackbotSurveyTimestamp7d: Swift.Int? = nil,
        enableStreamlineView: Swift.Bool? = nil,
        enableSentView: Swift.Bool? = nil,
        allowCallsToSetCurrentStatus: Swift.Bool? = nil,
        inInteractiveMasMigrationFlow: Swift.Bool? = nil,
        sunsetInteractiveMessageViews: Swift.Int? = nil,
        shdepPromoCodeSubmitted: Swift.Bool? = nil,
        seenShdepSlackbotMessage: Swift.Bool? = nil,
        seenCallsInteractiveCoachmark: Swift.Bool? = nil,
        allowCmdTabIss: Swift.Bool? = nil,
        joinCallsDeviceSettings: Swift.String? = nil,
        callsDisconnectOnLock: Swift.Bool? = nil,
        seenWorkflowBuilderDeluxeToast: Swift.Bool? = nil,
        workflowBuilderIntroModalClickedThrough: Swift.Bool? = nil,
        workflowBuilderCoachmarks: Swift.String? = nil,
        seenGdriveCoachmark: Swift.Bool? = nil,
        seenFirstInstallCoachmark: Swift.Bool? = nil,
        seenExistingInstallCoachmark: Swift.Bool? = nil,
        seenLinkUnfurlCoachmark: Swift.Bool? = nil,
        filePickerVariant: Swift.Int? = nil,
        openQuipDocInFlexpane: Swift.Bool? = nil,
        savedSearches: Swift.String? = nil,
        huddlesVariant: Swift.Int? = nil,
        huddlesCcByDefault: Swift.Bool? = nil,
        huddlesMuteByDefault: Swift.Bool? = nil,
        huddlesGlobalMute: Swift.Bool? = nil,
        huddlesMiniPanel: Swift.Bool? = nil,
        huddlesSetStatus: Swift.Bool? = nil,
        huddlesShowShoutyRooster: Swift.Bool? = nil,
        huddlesDisconnectOnLock: Swift.Bool? = nil,
        huddlesPlayMusicWhenLast: Swift.Bool? = nil,
        huddlesAllowSmartNotif: Swift.Bool? = nil,
        huddlesReactionsPlaySound: Swift.Bool? = nil,
        huddlesReactionsReadOutLoud: Swift.Bool? = nil,
        huddlesChimeNewEndpointsCheckCompleted: Swift.Int? = nil,
        xwsSidebarVariant: Swift.Int? = nil,
        inboxViewsWorkspaceFilter: Swift.String? = nil,
        overloadedMessageEnabled: Swift.Bool? = nil,
        seenHighlightsCoachmark: Swift.Bool? = nil,
        seenHighlightsArrowsCoachmark: Swift.Bool? = nil,
        seenHighlightsWarmWelcome: Swift.Bool? = nil,
        seenNewSearchUi: Swift.Bool? = nil,
        seenChannelSearch: Swift.Bool? = nil,
        seenPeopleSearch: Swift.Bool? = nil,
        seenPeopleSearchCount: Swift.Int? = nil,
        dismissedScrollSearchTooltipCount: Swift.Int? = nil,
        lastDismissedScrollSearchTooltipTimestamp: Swift.Int? = nil,
        hasUsedQuickswitcherShortcut: Swift.Bool? = nil,
        seenQuickswitcherShortcutTipCount: Swift.Int? = nil,
        browsersDismissedChannelsLowResultsEducation: Swift.Bool? = nil,
        browsersSeenInitialChannelsEducation: Swift.Bool? = nil,
        browsersDismissedPeopleLowResultsEducation: Swift.Bool? = nil,
        browsersSeenInitialPeopleEducation: Swift.Bool? = nil,
        browsersDismissedUserGroupsLowResultsEducation: Swift.Bool? = nil,
        browsersSeenInitialUserGroupsEducation: Swift.Bool? = nil,
        browsersDismissedFilesLowResultsEducation: Swift.Bool? = nil,
        browsersSeenInitialFilesEducation: Swift.Bool? = nil,
        browsersDismissedInitialDraftsEducation: Swift.Bool? = nil,
        browsersSeenInitialDraftsEducation: Swift.Bool? = nil,
        browsersDismissedInitialActivityEducation: Swift.Bool? = nil,
        browsersSeenInitialActivityEducation: Swift.Bool? = nil,
        browsersDismissedInitialSavedEducation: Swift.Bool? = nil,
        browsersSeenInitialSavedEducation: Swift.Bool? = nil,
        seenEditMode: Swift.Bool? = nil,
        seenEditModeEdu: Swift.Bool? = nil,
        xwsDismissedEducation: Swift.Bool? = nil,
        xwsSeenEducation: Swift.Int? = nil,
        sidebarPrefDismissedTip: Swift.Bool? = nil,
        a11yDyslexic: Swift.Bool? = nil,
        a11yAnimations: Swift.Bool? = nil,
        seenKeyboardShortcutsCoachmark: Swift.Bool? = nil,
        needsInitialPasswordSet: Swift.Bool? = nil,
        lessonsEnabled: Swift.Bool? = nil,
        tractorEnabled: Swift.Bool? = nil,
        tractorExperimentGroup: Swift.String? = nil,
        openedSlackbotDm: Swift.Bool? = nil,
        newxpSeenHelpMessage: Swift.Int? = nil,
        newxpSuggestedChannels: Swift.String? = nil,
        onboardingComplete: Swift.Bool? = nil,
        welcomePlaceState: Swift.String? = nil,
        hasReceivedThreadedMessage: Swift.Bool? = nil,
        joinerNotificationsMuted: Swift.Bool? = nil,
        inviteAcceptedNotificationsMuted: Swift.Bool? = nil,
        joinerMessageSuggestionDismissed: Swift.Bool? = nil,
        dismissedFullscreenDownloadSsbPrompt: Swift.Bool? = nil,
        dismissedBannerDownloadSsbPrompt: Swift.Bool? = nil,
        onboardingState: Swift.Int? = nil,
        whocanseethisDmMpdmBadge: Swift.Bool? = nil,
        highlightWords: Swift.String? = nil,
        threadsEverything: Swift.Bool? = nil,
        noTextInNotifications: Swift.Bool? = nil,
        pushShowPreview: Swift.Bool? = nil,
        growlsEnabled: Swift.Bool? = nil,
        allChannelsLoud: Swift.Bool? = nil,
        pushDmAlert: Swift.Bool? = nil,
        pushMentionAlert: Swift.Bool? = nil,
        pushEverything: Swift.Bool? = nil,
        pushIdleWait: Swift.Int? = nil,
        pushSound: Swift.String? = nil,
        newMsgSnd: Swift.String? = nil,
        huddleInviteSound: Swift.String? = nil,
        pushLoudChannels: Swift.String? = nil,
        pushMentionChannels: Swift.String? = nil,
        pushLoudChannelsSet: Swift.String? = nil,
        loudChannels: Swift.String? = nil,
        neverChannels: Swift.String? = nil,
        loudChannelsSet: Swift.String? = nil,
        atChannelSuppressedChannels: Swift.String? = nil,
        pushAtChannelSuppressedChannels: Swift.String? = nil,
        mutedChannels: Swift.String? = nil,
        allNotificationsPrefs: Swift.String? = nil,
        growthMsgLimitApproachingCtaCount: Swift.Int? = nil,
        growthMsgLimitApproachingCtaTs: Swift.Int? = nil,
        growthMsgLimitReachedCtaCount: Swift.Int? = nil,
        growthMsgLimitReachedCtaLastTs: Swift.Int? = nil,
        growthMsgLimitLongReachedCtaCount: Swift.Int? = nil,
        growthMsgLimitLongReachedCtaLastTs: Swift.Int? = nil,
        growthMsgLimitSixtyDayBannerCtaCount: Swift.Int? = nil,
        growthMsgLimitSixtyDayBannerCtaLastTs: Swift.Int? = nil,
        growthAllBannersPrefs: Swift.String? = nil,
        analyticsUpsellCoachmarkSeen: Swift.Bool? = nil,
        seenAppSpaceCoachmark: Swift.Bool? = nil,
        seenAppSpaceTutorial: Swift.Bool? = nil,
        dismissedAppLauncherWelcome: Swift.Bool? = nil,
        dismissedAppLauncherLimit: Swift.Bool? = nil,
        dismissedAppLauncherAtlassianPromo: Swift.Bool? = nil,
        enableAppConfigRedesign: Swift.Bool? = nil,
        dismissedAppConfigRedesignCoachmark: Swift.Bool? = nil,
        dismissedAppManifestDescription: Swift.Bool? = nil,
        dismissedAppManifestCoachmark: Swift.Bool? = nil,
        seenChannelEmailTooltip: Swift.Bool? = nil,
        showEntOnboarding: Swift.Bool? = nil,
        foldersEnabled: Swift.Bool? = nil,
        folderData: Swift.String? = nil,
        seenCorporateExportAlert: Swift.Bool? = nil,
        showAutocompleteHelp: Swift.Int? = nil,
        deprecationToastLastSeen: Swift.Int? = nil,
        deprecationModalLastSeen: Swift.Int? = nil,
        deprecationBannerLastSeen: Swift.Int? = nil,
        iap1Lab: Swift.Int? = nil,
        iaTopNavTheme: Swift.String? = nil,
        iaPlatformActionsLab: Swift.Int? = nil,
        activityView: Swift.String? = nil,
        savedView: Swift.String? = nil,
        seenFloatingSidebarCoachmark: Swift.Bool? = nil,
        desktopClientIds: Swift.String? = nil,
        failoverProxyCheckCompleted: Swift.Int? = nil,
        chimeAccessCheckCompleted: Swift.Int? = nil,
        mxCalendarType: Swift.String? = nil,
        edgeUploadProxyCheckCompleted: Swift.Int? = nil,
        appSubdomainCheckCompleted: Swift.Int? = nil,
        addPromptInteracted: Swift.Bool? = nil,
        addAppsPromptDismissed: Swift.Bool? = nil,
        addChannelPromptDismissed: Swift.Bool? = nil,
        channelSidebarHideInvite: Swift.Bool? = nil,
        channelSidebarHideBrowseDmsLink: Swift.Bool? = nil,
        inProdSurveysEnabled: Swift.Bool? = nil,
        connectDmEarlyAccess: Swift.Bool? = nil,
        dismissedInstalledAppDmSuggestions: Swift.String? = nil,
        seenContextualMessageShortcutsModal: Swift.Bool? = nil,
        seenMessageNavigationEducationalToast: Swift.Bool? = nil,
        contextualMessageShortcutsModalWasSeen: Swift.Bool? = nil,
        messageNavigationToastWasSeen: Swift.Bool? = nil,
        upToBrowseKbShortcut: Swift.Bool? = nil,
        setA11yPrefsNewUser: Swift.Bool? = nil,
        a11yPlaySoundForIncomingDm: Swift.Bool? = nil,
        a11yPlaySoundForSentDm: Swift.Bool? = nil,
        a11yReadOutIncomingDm: Swift.Bool? = nil,
        a11yScreenReaderMessageLabelDateTimeFirst: Swift.Bool? = nil,
        shouldShowContextualHelpForConversationNavigation: Swift.Bool? = nil,
        shouldShowContextualHelpForJumpToConversation: Swift.Bool? = nil,
        shouldShowContextualHelpForSectionNavigation: Swift.Bool? = nil,
        shouldShowContextualHelpForThreadNavigation: Swift.Bool? = nil,
        shouldShowUnsendMessageConfirmation: Swift.Bool? = nil,
        channelSections: Swift.String? = nil,
        showQuickReactions: Swift.Bool? = nil,
        userCustomizedQuickReactionsDisplayFeature: Swift.Int? = nil,
        userCustomizedQuickReactionsHasCustomized: Swift.Bool? = nil,
        userCustomizedQuickReactionsUseFrequentlyUsedEmoji: Swift.Bool? = nil,
        reactionNotifications: Swift.String? = nil,
        hasReceivedMentionOrReaction: Swift.Bool? = nil,
        hasStarredItem: Swift.Bool? = nil,
        hasDraftedMessage: Swift.Bool? = nil,
        enableMentionsAndReactionsView: Swift.Bool? = nil,
        enableRemindersView: Swift.Bool? = nil,
        enableSavedItemsView: Swift.Bool? = nil,
        enableHqView: Swift.Bool? = nil,
        enableAllDmsView: Swift.Bool? = nil,
        enableChannelBrowserView: Swift.Bool? = nil,
        enableFileBrowserView: Swift.Bool? = nil,
        enablePeopleBrowserView: Swift.Bool? = nil,
        enableAppBrowserView: Swift.Bool? = nil,
        reachedAllDmsDisclosure: Swift.Bool? = nil,
        enableSlackConnectView: Swift.Bool? = nil,
        enableSlackConnectView2: Swift.Int? = nil,
        hasAcknowledgedShortcutSpeedbump: Swift.Bool? = nil,
        enableMediaCaptions: Swift.Bool? = nil,
        mediaPlaybackSpeed: Swift.Int? = nil,
        mediaMuted: Swift.Bool? = nil,
        mediaVolume: Swift.Int? = nil,
        dismissedConnectAutoApprovalModal: Swift.String? = nil,
        tasksView: Swift.String? = nil,
        showSidebarAvatars: Swift.Bool? = nil,
        hasDismissedGoogleDirectoryCoachmark: Swift.Bool? = nil,
        seenScPageBanner: Swift.Bool? = nil,
        seenScMenuCoachmark: Swift.Bool? = nil,
        seenScPage: Swift.Bool? = nil,
        dismissedScdmEducation: Swift.Bool? = nil,
        seenBookmarksIntro: Swift.Bool? = nil,
        scdmTrialOfferBanner: Swift.String? = nil,
        identityLinksPrefs: Swift.String? = nil,
        identityLinksGlobalPrefs: Swift.String? = nil,
        seenSectionsUnreadsOnlyPromptCount: Swift.Int? = nil,
        lastSeenSectionsUnreadsOnlyPromptTimestamp: Swift.Int? = nil,
        notificationsView: Swift.String? = nil,
        progressiveDisclosureState: Swift.String? = nil,
        suggestionsRequestId: Swift.String? = nil,
        allowedUnfurlSenders: Swift.String? = nil,
        iaDetailsCoachmarkSeen: Swift.Bool? = nil,
        hideExternalMembersSharingSpeedBump: Swift.Bool? = nil,
        whoCanShareContactCard: Swift.String? = nil,
        slackConnectInviteShouldBadgeSidebar: Swift.Bool? = nil,
        phcDismissed: Swift.String? = nil,
        dismissedGovSlackFirstTimePopup: Swift.Bool? = nil,
        mobileChannelListSort: Swift.String? = nil,
        userExpectationsSurveyLastTriggerAttempt: Swift.Int? = nil,
        localesEnabled: SlackModels.LocalesEnabled? = nil,
        phcViewed: Swift.String? = nil,
        seenA11yPrefSetupCoachmark: Swift.Bool? = nil,
        enableFileBrowserViewForDocs: Swift.Bool? = nil,
        enableShortcutsView: Swift.Bool? = nil,
        showGovSlackContextBarBanner: Swift.Bool? = nil,
        whoCanSeeAccountBySearchingEmail: Swift.String? = nil,
        contextualHelpResetCount: Swift.Int? = nil,
        mobileChannelListShowAllDms: Swift.Bool? = nil,
        enableQuipFileBrowserView: Swift.Bool? = nil,
        a11yPlaySoundForIncomingDmChoice: Swift.String? = nil,
        a11yPlaySoundForSentDmChoice: Swift.String? = nil,
        onboardingTipOptOut: Swift.Bool? = nil,
        seenOnboardingSynthView: Swift.Bool? = nil,
        enableDraftsView: Swift.Bool? = nil,
        enableScheduledView: Swift.Bool? = nil,
        seenSentPageInSidebar: Swift.Bool? = nil,
        firstSeenSentPageInSidebar: Swift.Int? = nil,
        seenNewBadgeInMoreMenuSidebar: Swift.Bool? = nil,
        firstSeenNewBadgeInMoreMenuSidebar: Swift.Int? = nil,
        seenOnboardingSynthViewCount: Swift.Int? = nil,
        synthViewPrefs: Swift.String? = nil,
        clipsFeedbackSurveyLastTriggerAttempt: Swift.Int? = nil,
        enableLaterView: Swift.Bool? = nil,
        hasJoinedHuddle: Swift.Bool? = nil,
        hasSentTenMessages: Swift.Int? = nil,
        suppressThreadMentionWarning: Swift.Bool? = nil,
        hiddenUsers: Swift.String? = nil,
        dismissedSentPageEducation: Swift.Bool? = nil,
        seenOnboardingSynthViewV2: Swift.Bool? = nil,
        clickedCloseOnboardingSynthViewBanner: Swift.Bool? = nil,
        seenOnboardingSynthViewCountV2: Swift.Int? = nil,
        appManifestSchemaFormat: Swift.String? = nil,
        channelCanvasVariant: Swift.Int? = nil
    ) {
        self.time24 = time24
        self.jumbomoji = jumbomoji
        self.locale = locale
        self.purchaser = purchaser
        self.tz = tz
        self.frecency = frecency
        self.underlineLinks = underlineLinks
        self.userColors = userColors
        self.colorNamesInList = colorNamesInList
        self.emailAlerts = emailAlerts
        self.emailAlertsSleepUntil = emailAlertsSleepUntil
        self.emailTips = emailTips
        self.emailWeekly = emailWeekly
        self.emailOffers = emailOffers
        self.emailResearch = emailResearch
        self.emailDeveloper = emailDeveloper
        self.welcomeMessageHidden = welcomeMessageHidden
        self.searchSort = searchSort
        self.searchFileSort = searchFileSort
        self.searchChannelSort = searchChannelSort
        self.searchPeopleSort = searchPeopleSort
        self.expandInlineImgs = expandInlineImgs
        self.expandInternalInlineImgs = expandInternalInlineImgs
        self.expandSnippets = expandSnippets
        self.postsFormattingGuide = postsFormattingGuide
        self.seenWelcome2 = seenWelcome2
        self.seenSsbPrompt = seenSsbPrompt
        self.spacesNewXpBannerDismissed = spacesNewXpBannerDismissed
        self.searchOnlyMyChannels = searchOnlyMyChannels
        self.searchOnlyCurrentTeam = searchOnlyCurrentTeam
        self.searchHideMyChannels = searchHideMyChannels
        self.searchOnlyShowOnline = searchOnlyShowOnline
        self.searchHideDeactivatedUsers = searchHideDeactivatedUsers
        self.emojiMode = emojiMode
        self.emojiUse = emojiUse
        self.emojiUseOrg = emojiUseOrg
        self.hasInvited = hasInvited
        self.hasUploaded = hasUploaded
        self.hasCreatedChannel = hasCreatedChannel
        self.hasCreatedChannelSection = hasCreatedChannelSection
        self.hasSearched = hasSearched
        self.searchExcludeChannels = searchExcludeChannels
        self.messagesTheme = messagesTheme
        self.webappSpellcheck = webappSpellcheck
        self.noJoinedOverlays = noJoinedOverlays
        self.noCreatedOverlays = noCreatedOverlays
        self.dropboxEnabled = dropboxEnabled
        self.seenDomainInviteReminder = seenDomainInviteReminder
        self.seenMemberInviteReminder = seenMemberInviteReminder
        self.muteSounds = muteSounds
        self.arrowHistory = arrowHistory
        self.tabUiReturnSelects = tabUiReturnSelects
        self.obeyInlineImgLimit = obeyInlineImgLimit
        self.requireAt = requireAt
        self.ssbSpaceWindow = ssbSpaceWindow
        self.macSsbBounce = macSsbBounce
        self.macSsbBullet = macSsbBullet
        self.expandNonMediaAttachments = expandNonMediaAttachments
        self.showTyping = showTyping
        self.pagekeysHandled = pagekeysHandled
        self.lastSnippetType = lastSnippetType
        self.displayRealNamesOverride = displayRealNamesOverride
        self.displayDisplayNames = displayDisplayNames
        self.enterIsSpecialInTbt = enterIsSpecialInTbt
        self.msgInputSendBtn = msgInputSendBtn
        self.msgInputSendBtnAutoSet = msgInputSendBtnAutoSet
        self.msgInputStickyComposer = msgInputStickyComposer
        self.composerNux = composerNux
        self.graphicEmoticons = graphicEmoticons
        self.convertEmoticons = convertEmoticons
        self.ssEmojis = ssEmojis
        self.seenOnboardingStart = seenOnboardingStart
        self.onboardingCancelled = onboardingCancelled
        self.seenOnboardingSlackbotConversation = seenOnboardingSlackbotConversation
        self.seenOnboardingChannels = seenOnboardingChannels
        self.seenOnboardingDirectMessages = seenOnboardingDirectMessages
        self.seenOnboardingInvites = seenOnboardingInvites
        self.seenOnboardingSearch = seenOnboardingSearch
        self.seenOnboardingRecentMentions = seenOnboardingRecentMentions
        self.seenOnboardingStarredItems = seenOnboardingStarredItems
        self.seenOnboardingPrivateGroups = seenOnboardingPrivateGroups
        self.seenOnboardingBanner = seenOnboardingBanner
        self.onboardingSlackbotConversationStep = onboardingSlackbotConversationStep
        self.setTzAutomatically = setTzAutomatically
        self.suppressLinkWarning = suppressLinkWarning
        self.suppressExternalInvitesFromComposeWarning = suppressExternalInvitesFromComposeWarning
        self.seenEmojiPackCta = seenEmojiPackCta
        self.seenEmojiPackDialog = seenEmojiPackDialog
        self.seenScheduleSendCoachmark = seenScheduleSendCoachmark
        self.emojiPacksMostRecentAvailableTime = emojiPacksMostRecentAvailableTime
        self.emojiPacksClickedPickerCta = emojiPacksClickedPickerCta
        self.emojiPacksClickedPickerPostInstallCta = emojiPacksClickedPickerPostInstallCta
        self.emojiPacksClickedCollectionCta = emojiPacksClickedCollectionCta
        self.dndEnabled = dndEnabled
        self.dndStartHour = dndStartHour
        self.dndEndHour = dndEndHour
        self.dndBeforeMonday = dndBeforeMonday
        self.dndAfterMonday = dndAfterMonday
        self.dndEnabledMonday = dndEnabledMonday
        self.dndBeforeTuesday = dndBeforeTuesday
        self.dndAfterTuesday = dndAfterTuesday
        self.dndEnabledTuesday = dndEnabledTuesday
        self.dndBeforeWednesday = dndBeforeWednesday
        self.dndAfterWednesday = dndAfterWednesday
        self.dndEnabledWednesday = dndEnabledWednesday
        self.dndBeforeThursday = dndBeforeThursday
        self.dndAfterThursday = dndAfterThursday
        self.dndEnabledThursday = dndEnabledThursday
        self.dndBeforeFriday = dndBeforeFriday
        self.dndAfterFriday = dndAfterFriday
        self.dndEnabledFriday = dndEnabledFriday
        self.dndBeforeSaturday = dndBeforeSaturday
        self.dndAfterSaturday = dndAfterSaturday
        self.dndEnabledSaturday = dndEnabledSaturday
        self.dndBeforeSunday = dndBeforeSunday
        self.dndAfterSunday = dndAfterSunday
        self.dndEnabledSunday = dndEnabledSunday
        self.dndDays = dndDays
        self.dndWeekdaysOffAllday = dndWeekdaysOffAllday
        self.reminderNotificationTime = reminderNotificationTime
        self.dndCustomNewBadgeSeen = dndCustomNewBadgeSeen
        self.dndNotificationScheduleNewBadgeSeen = dndNotificationScheduleNewBadgeSeen
        self.notificationCenterFilters = notificationCenterFilters
        self.callsSurveyLastSeen = callsSurveyLastSeen
        self.huddleSurveyLastSeen = huddleSurveyLastSeen
        self.sidebarBehavior = sidebarBehavior
        self.channelSort = channelSort
        self.separatePrivateChannels = separatePrivateChannels
        self.separateSharedChannels = separateSharedChannels
        self.sidebarTheme = sidebarTheme
        self.sidebarThemeCustomValues = sidebarThemeCustomValues
        self.noInvitesWidgetInSidebar = noInvitesWidgetInSidebar
        self.noOmniboxInChannels = noOmniboxInChannels
        self.kKeyOmniboxAutoHideCount = kKeyOmniboxAutoHideCount
        self.showSidebarQuickswitcherButton = showSidebarQuickswitcherButton
        self.entOrgWideChannelsSidebar = entOrgWideChannelsSidebar
        self.markMsgsReadImmediately = markMsgsReadImmediately
        self.startScrollAtOldest = startScrollAtOldest
        self.snippetEditorWrapLongLines = snippetEditorWrapLongLines
        self.lsDisabled = lsDisabled
        self.fKeySearch = fKeySearch
        self.kKeyOmnibox = kKeyOmnibox
        self.promptedForEmailDisabling = promptedForEmailDisabling
        self.noMacelectronBanner = noMacelectronBanner
        self.noMacssb1Banner = noMacssb1Banner
        self.noMacssb2Banner = noMacssb2Banner
        self.noWinssb1Banner = noWinssb1Banner
        self.hideUserGroupInfoPane = hideUserGroupInfoPane
        self.mentionsExcludeAtUserGroups = mentionsExcludeAtUserGroups
        self.mentionsExcludeReactions = mentionsExcludeReactions
        self.privacyPolicySeen = privacyPolicySeen
        self.enterpriseMigrationSeen = enterpriseMigrationSeen
        self.searchExcludeBots = searchExcludeBots
        self.loadLato2 = loadLato2
        self.fullerTimestamps = fullerTimestamps
        self.lastSeenAtChannelWarning = lastSeenAtChannelWarning
        self.emojiAutocompleteBig = emojiAutocompleteBig
        self.twoFactorAuthEnabled = twoFactorAuthEnabled
        self.hideHexSwatch = hideHexSwatch
        self.showJumperScores = showJumperScores
        self.enterpriseMdmCustomMsg = enterpriseMdmCustomMsg
        self.clientLogsPri = clientLogsPri
        self.flannelServerPool = flannelServerPool
        self.mentionsExcludeAtChannels = mentionsExcludeAtChannels
        self.confirmClearAllUnreads = confirmClearAllUnreads
        self.confirmUserMarkedAway = confirmUserMarkedAway
        self.boxEnabled = boxEnabled
        self.seenSingleEmojiMsg = seenSingleEmojiMsg
        self.confirmShCallStart = confirmShCallStart
        self.preferredSkinTone = preferredSkinTone
        self.showAllSkinTones = showAllSkinTones
        self.whatsNewRead = whatsNewRead
        self.helpModalOpenTimestamp = helpModalOpenTimestamp
        self.helpModalConsultBannerDismissed = helpModalConsultBannerDismissed
        self.helpFlexpaneSlackConnectCardSeen = helpFlexpaneSlackConnectCardSeen
        self.helpFlexpaneClipsCardSeen = helpFlexpaneClipsCardSeen
        self.helpMenuOpenTimestamp = helpMenuOpenTimestamp
        self.frecencyJumper = frecencyJumper
        self.frecencyEntJumper = frecencyEntJumper
        self.newxpSeenLastMessage = newxpSeenLastMessage
        self.showMemoryInstrument = showMemoryInstrument
        self.enableUnreadView = enableUnreadView
        self.seenUnreadViewCoachmark = seenUnreadViewCoachmark
        self.seenConnectDmCoachmark = seenConnectDmCoachmark
        self.seenConnectSectionCoachmark = seenConnectSectionCoachmark
        self.shouldShowConnectSection = shouldShowConnectSection
        self.enableReactEmojiPicker = enableReactEmojiPicker
        self.seenCustomStatusBadge = seenCustomStatusBadge
        self.seenCustomStatusCallout = seenCustomStatusCallout
        self.seenCustomStatusExpirationBadge = seenCustomStatusExpirationBadge
        self.usedCustomStatusKbShortcut = usedCustomStatusKbShortcut
        self.seenGuestAdminSlackbotAnnouncement = seenGuestAdminSlackbotAnnouncement
        self.seenThreadsNotificationBanner = seenThreadsNotificationBanner
        self.seenNameTaggingCoachmark = seenNameTaggingCoachmark
        self.allUnreadsSortOrder = allUnreadsSortOrder
        self.allUnreadsSectionFilter = allUnreadsSectionFilter
        self.seenIntlChannelNamesCoachmark = seenIntlChannelNamesCoachmark
        self.seenP3LocaleChangeMessageKoKr = seenP3LocaleChangeMessageKoKr
        self.seenToastNewLocaleLaunch = seenToastNewLocaleLaunch
        self.seenToastNewLocaleLaunchTs = seenToastNewLocaleLaunchTs
        self.seenLocaleChangeMessage = seenLocaleChangeMessage
        self.seenJapaneseLocaleChangeMessage = seenJapaneseLocaleChangeMessage
        self.seenSharedChannelsCoachmark = seenSharedChannelsCoachmark
        self.seenSharedChannelsOptInChangeMessage = seenSharedChannelsOptInChangeMessage
        self.hasRecentlySharedAChannel = hasRecentlySharedAChannel
        self.seenChannelBrowserAdminCoachmark = seenChannelBrowserAdminCoachmark
        self.seenAdministrationMenu = seenAdministrationMenu
        self.seenDraftsSectionCoachmark = seenDraftsSectionCoachmark
        self.seenEmojiUpdateOverlayCoachmark = seenEmojiUpdateOverlayCoachmark
        self.seenSonicDeluxeToast = seenSonicDeluxeToast
        self.seenWysiwygDeluxeToast = seenWysiwygDeluxeToast
        self.seenMarkdownPasteToast = seenMarkdownPasteToast
        self.seenMarkdownPasteShortcut = seenMarkdownPasteShortcut
        self.seenIaEducation = seenIaEducation
        self.showIaTourRelaunch = showIaTourRelaunch
        self.plainTextMode = plainTextMode
        self.showSharedChannelsEducationBanner = showSharedChannelsEducationBanner
        self.iaSlackbotSurveyTimestamp48h = iaSlackbotSurveyTimestamp48h
        self.iaSlackbotSurveyTimestamp7d = iaSlackbotSurveyTimestamp7d
        self.enableStreamlineView = enableStreamlineView
        self.enableSentView = enableSentView
        self.allowCallsToSetCurrentStatus = allowCallsToSetCurrentStatus
        self.inInteractiveMasMigrationFlow = inInteractiveMasMigrationFlow
        self.sunsetInteractiveMessageViews = sunsetInteractiveMessageViews
        self.shdepPromoCodeSubmitted = shdepPromoCodeSubmitted
        self.seenShdepSlackbotMessage = seenShdepSlackbotMessage
        self.seenCallsInteractiveCoachmark = seenCallsInteractiveCoachmark
        self.allowCmdTabIss = allowCmdTabIss
        self.joinCallsDeviceSettings = joinCallsDeviceSettings
        self.callsDisconnectOnLock = callsDisconnectOnLock
        self.seenWorkflowBuilderDeluxeToast = seenWorkflowBuilderDeluxeToast
        self.workflowBuilderIntroModalClickedThrough = workflowBuilderIntroModalClickedThrough
        self.workflowBuilderCoachmarks = workflowBuilderCoachmarks
        self.seenGdriveCoachmark = seenGdriveCoachmark
        self.seenFirstInstallCoachmark = seenFirstInstallCoachmark
        self.seenExistingInstallCoachmark = seenExistingInstallCoachmark
        self.seenLinkUnfurlCoachmark = seenLinkUnfurlCoachmark
        self.filePickerVariant = filePickerVariant
        self.openQuipDocInFlexpane = openQuipDocInFlexpane
        self.savedSearches = savedSearches
        self.huddlesVariant = huddlesVariant
        self.huddlesCcByDefault = huddlesCcByDefault
        self.huddlesMuteByDefault = huddlesMuteByDefault
        self.huddlesGlobalMute = huddlesGlobalMute
        self.huddlesMiniPanel = huddlesMiniPanel
        self.huddlesSetStatus = huddlesSetStatus
        self.huddlesShowShoutyRooster = huddlesShowShoutyRooster
        self.huddlesDisconnectOnLock = huddlesDisconnectOnLock
        self.huddlesPlayMusicWhenLast = huddlesPlayMusicWhenLast
        self.huddlesAllowSmartNotif = huddlesAllowSmartNotif
        self.huddlesReactionsPlaySound = huddlesReactionsPlaySound
        self.huddlesReactionsReadOutLoud = huddlesReactionsReadOutLoud
        self.huddlesChimeNewEndpointsCheckCompleted = huddlesChimeNewEndpointsCheckCompleted
        self.xwsSidebarVariant = xwsSidebarVariant
        self.inboxViewsWorkspaceFilter = inboxViewsWorkspaceFilter
        self.overloadedMessageEnabled = overloadedMessageEnabled
        self.seenHighlightsCoachmark = seenHighlightsCoachmark
        self.seenHighlightsArrowsCoachmark = seenHighlightsArrowsCoachmark
        self.seenHighlightsWarmWelcome = seenHighlightsWarmWelcome
        self.seenNewSearchUi = seenNewSearchUi
        self.seenChannelSearch = seenChannelSearch
        self.seenPeopleSearch = seenPeopleSearch
        self.seenPeopleSearchCount = seenPeopleSearchCount
        self.dismissedScrollSearchTooltipCount = dismissedScrollSearchTooltipCount
        self.lastDismissedScrollSearchTooltipTimestamp = lastDismissedScrollSearchTooltipTimestamp
        self.hasUsedQuickswitcherShortcut = hasUsedQuickswitcherShortcut
        self.seenQuickswitcherShortcutTipCount = seenQuickswitcherShortcutTipCount
        self.browsersDismissedChannelsLowResultsEducation = browsersDismissedChannelsLowResultsEducation
        self.browsersSeenInitialChannelsEducation = browsersSeenInitialChannelsEducation
        self.browsersDismissedPeopleLowResultsEducation = browsersDismissedPeopleLowResultsEducation
        self.browsersSeenInitialPeopleEducation = browsersSeenInitialPeopleEducation
        self.browsersDismissedUserGroupsLowResultsEducation = browsersDismissedUserGroupsLowResultsEducation
        self.browsersSeenInitialUserGroupsEducation = browsersSeenInitialUserGroupsEducation
        self.browsersDismissedFilesLowResultsEducation = browsersDismissedFilesLowResultsEducation
        self.browsersSeenInitialFilesEducation = browsersSeenInitialFilesEducation
        self.browsersDismissedInitialDraftsEducation = browsersDismissedInitialDraftsEducation
        self.browsersSeenInitialDraftsEducation = browsersSeenInitialDraftsEducation
        self.browsersDismissedInitialActivityEducation = browsersDismissedInitialActivityEducation
        self.browsersSeenInitialActivityEducation = browsersSeenInitialActivityEducation
        self.browsersDismissedInitialSavedEducation = browsersDismissedInitialSavedEducation
        self.browsersSeenInitialSavedEducation = browsersSeenInitialSavedEducation
        self.seenEditMode = seenEditMode
        self.seenEditModeEdu = seenEditModeEdu
        self.xwsDismissedEducation = xwsDismissedEducation
        self.xwsSeenEducation = xwsSeenEducation
        self.sidebarPrefDismissedTip = sidebarPrefDismissedTip
        self.a11yDyslexic = a11yDyslexic
        self.a11yAnimations = a11yAnimations
        self.seenKeyboardShortcutsCoachmark = seenKeyboardShortcutsCoachmark
        self.needsInitialPasswordSet = needsInitialPasswordSet
        self.lessonsEnabled = lessonsEnabled
        self.tractorEnabled = tractorEnabled
        self.tractorExperimentGroup = tractorExperimentGroup
        self.openedSlackbotDm = openedSlackbotDm
        self.newxpSeenHelpMessage = newxpSeenHelpMessage
        self.newxpSuggestedChannels = newxpSuggestedChannels
        self.onboardingComplete = onboardingComplete
        self.welcomePlaceState = welcomePlaceState
        self.hasReceivedThreadedMessage = hasReceivedThreadedMessage
        self.joinerNotificationsMuted = joinerNotificationsMuted
        self.inviteAcceptedNotificationsMuted = inviteAcceptedNotificationsMuted
        self.joinerMessageSuggestionDismissed = joinerMessageSuggestionDismissed
        self.dismissedFullscreenDownloadSsbPrompt = dismissedFullscreenDownloadSsbPrompt
        self.dismissedBannerDownloadSsbPrompt = dismissedBannerDownloadSsbPrompt
        self.onboardingState = onboardingState
        self.whocanseethisDmMpdmBadge = whocanseethisDmMpdmBadge
        self.highlightWords = highlightWords
        self.threadsEverything = threadsEverything
        self.noTextInNotifications = noTextInNotifications
        self.pushShowPreview = pushShowPreview
        self.growlsEnabled = growlsEnabled
        self.allChannelsLoud = allChannelsLoud
        self.pushDmAlert = pushDmAlert
        self.pushMentionAlert = pushMentionAlert
        self.pushEverything = pushEverything
        self.pushIdleWait = pushIdleWait
        self.pushSound = pushSound
        self.newMsgSnd = newMsgSnd
        self.huddleInviteSound = huddleInviteSound
        self.pushLoudChannels = pushLoudChannels
        self.pushMentionChannels = pushMentionChannels
        self.pushLoudChannelsSet = pushLoudChannelsSet
        self.loudChannels = loudChannels
        self.neverChannels = neverChannels
        self.loudChannelsSet = loudChannelsSet
        self.atChannelSuppressedChannels = atChannelSuppressedChannels
        self.pushAtChannelSuppressedChannels = pushAtChannelSuppressedChannels
        self.mutedChannels = mutedChannels
        self.allNotificationsPrefs = allNotificationsPrefs
        self.growthMsgLimitApproachingCtaCount = growthMsgLimitApproachingCtaCount
        self.growthMsgLimitApproachingCtaTs = growthMsgLimitApproachingCtaTs
        self.growthMsgLimitReachedCtaCount = growthMsgLimitReachedCtaCount
        self.growthMsgLimitReachedCtaLastTs = growthMsgLimitReachedCtaLastTs
        self.growthMsgLimitLongReachedCtaCount = growthMsgLimitLongReachedCtaCount
        self.growthMsgLimitLongReachedCtaLastTs = growthMsgLimitLongReachedCtaLastTs
        self.growthMsgLimitSixtyDayBannerCtaCount = growthMsgLimitSixtyDayBannerCtaCount
        self.growthMsgLimitSixtyDayBannerCtaLastTs = growthMsgLimitSixtyDayBannerCtaLastTs
        self.growthAllBannersPrefs = growthAllBannersPrefs
        self.analyticsUpsellCoachmarkSeen = analyticsUpsellCoachmarkSeen
        self.seenAppSpaceCoachmark = seenAppSpaceCoachmark
        self.seenAppSpaceTutorial = seenAppSpaceTutorial
        self.dismissedAppLauncherWelcome = dismissedAppLauncherWelcome
        self.dismissedAppLauncherLimit = dismissedAppLauncherLimit
        self.dismissedAppLauncherAtlassianPromo = dismissedAppLauncherAtlassianPromo
        self.enableAppConfigRedesign = enableAppConfigRedesign
        self.dismissedAppConfigRedesignCoachmark = dismissedAppConfigRedesignCoachmark
        self.dismissedAppManifestDescription = dismissedAppManifestDescription
        self.dismissedAppManifestCoachmark = dismissedAppManifestCoachmark
        self.seenChannelEmailTooltip = seenChannelEmailTooltip
        self.showEntOnboarding = showEntOnboarding
        self.foldersEnabled = foldersEnabled
        self.folderData = folderData
        self.seenCorporateExportAlert = seenCorporateExportAlert
        self.showAutocompleteHelp = showAutocompleteHelp
        self.deprecationToastLastSeen = deprecationToastLastSeen
        self.deprecationModalLastSeen = deprecationModalLastSeen
        self.deprecationBannerLastSeen = deprecationBannerLastSeen
        self.iap1Lab = iap1Lab
        self.iaTopNavTheme = iaTopNavTheme
        self.iaPlatformActionsLab = iaPlatformActionsLab
        self.activityView = activityView
        self.savedView = savedView
        self.seenFloatingSidebarCoachmark = seenFloatingSidebarCoachmark
        self.desktopClientIds = desktopClientIds
        self.failoverProxyCheckCompleted = failoverProxyCheckCompleted
        self.chimeAccessCheckCompleted = chimeAccessCheckCompleted
        self.mxCalendarType = mxCalendarType
        self.edgeUploadProxyCheckCompleted = edgeUploadProxyCheckCompleted
        self.appSubdomainCheckCompleted = appSubdomainCheckCompleted
        self.addPromptInteracted = addPromptInteracted
        self.addAppsPromptDismissed = addAppsPromptDismissed
        self.addChannelPromptDismissed = addChannelPromptDismissed
        self.channelSidebarHideInvite = channelSidebarHideInvite
        self.channelSidebarHideBrowseDmsLink = channelSidebarHideBrowseDmsLink
        self.inProdSurveysEnabled = inProdSurveysEnabled
        self.connectDmEarlyAccess = connectDmEarlyAccess
        self.dismissedInstalledAppDmSuggestions = dismissedInstalledAppDmSuggestions
        self.seenContextualMessageShortcutsModal = seenContextualMessageShortcutsModal
        self.seenMessageNavigationEducationalToast = seenMessageNavigationEducationalToast
        self.contextualMessageShortcutsModalWasSeen = contextualMessageShortcutsModalWasSeen
        self.messageNavigationToastWasSeen = messageNavigationToastWasSeen
        self.upToBrowseKbShortcut = upToBrowseKbShortcut
        self.setA11yPrefsNewUser = setA11yPrefsNewUser
        self.a11yPlaySoundForIncomingDm = a11yPlaySoundForIncomingDm
        self.a11yPlaySoundForSentDm = a11yPlaySoundForSentDm
        self.a11yReadOutIncomingDm = a11yReadOutIncomingDm
        self.a11yScreenReaderMessageLabelDateTimeFirst = a11yScreenReaderMessageLabelDateTimeFirst
        self.shouldShowContextualHelpForConversationNavigation = shouldShowContextualHelpForConversationNavigation
        self.shouldShowContextualHelpForJumpToConversation = shouldShowContextualHelpForJumpToConversation
        self.shouldShowContextualHelpForSectionNavigation = shouldShowContextualHelpForSectionNavigation
        self.shouldShowContextualHelpForThreadNavigation = shouldShowContextualHelpForThreadNavigation
        self.shouldShowUnsendMessageConfirmation = shouldShowUnsendMessageConfirmation
        self.channelSections = channelSections
        self.showQuickReactions = showQuickReactions
        self.userCustomizedQuickReactionsDisplayFeature = userCustomizedQuickReactionsDisplayFeature
        self.userCustomizedQuickReactionsHasCustomized = userCustomizedQuickReactionsHasCustomized
        self.userCustomizedQuickReactionsUseFrequentlyUsedEmoji = userCustomizedQuickReactionsUseFrequentlyUsedEmoji
        self.reactionNotifications = reactionNotifications
        self.hasReceivedMentionOrReaction = hasReceivedMentionOrReaction
        self.hasStarredItem = hasStarredItem
        self.hasDraftedMessage = hasDraftedMessage
        self.enableMentionsAndReactionsView = enableMentionsAndReactionsView
        self.enableRemindersView = enableRemindersView
        self.enableSavedItemsView = enableSavedItemsView
        self.enableHqView = enableHqView
        self.enableAllDmsView = enableAllDmsView
        self.enableChannelBrowserView = enableChannelBrowserView
        self.enableFileBrowserView = enableFileBrowserView
        self.enablePeopleBrowserView = enablePeopleBrowserView
        self.enableAppBrowserView = enableAppBrowserView
        self.reachedAllDmsDisclosure = reachedAllDmsDisclosure
        self.enableSlackConnectView = enableSlackConnectView
        self.enableSlackConnectView2 = enableSlackConnectView2
        self.hasAcknowledgedShortcutSpeedbump = hasAcknowledgedShortcutSpeedbump
        self.enableMediaCaptions = enableMediaCaptions
        self.mediaPlaybackSpeed = mediaPlaybackSpeed
        self.mediaMuted = mediaMuted
        self.mediaVolume = mediaVolume
        self.dismissedConnectAutoApprovalModal = dismissedConnectAutoApprovalModal
        self.tasksView = tasksView
        self.showSidebarAvatars = showSidebarAvatars
        self.hasDismissedGoogleDirectoryCoachmark = hasDismissedGoogleDirectoryCoachmark
        self.seenScPageBanner = seenScPageBanner
        self.seenScMenuCoachmark = seenScMenuCoachmark
        self.seenScPage = seenScPage
        self.dismissedScdmEducation = dismissedScdmEducation
        self.seenBookmarksIntro = seenBookmarksIntro
        self.scdmTrialOfferBanner = scdmTrialOfferBanner
        self.identityLinksPrefs = identityLinksPrefs
        self.identityLinksGlobalPrefs = identityLinksGlobalPrefs
        self.seenSectionsUnreadsOnlyPromptCount = seenSectionsUnreadsOnlyPromptCount
        self.lastSeenSectionsUnreadsOnlyPromptTimestamp = lastSeenSectionsUnreadsOnlyPromptTimestamp
        self.notificationsView = notificationsView
        self.progressiveDisclosureState = progressiveDisclosureState
        self.suggestionsRequestId = suggestionsRequestId
        self.allowedUnfurlSenders = allowedUnfurlSenders
        self.iaDetailsCoachmarkSeen = iaDetailsCoachmarkSeen
        self.hideExternalMembersSharingSpeedBump = hideExternalMembersSharingSpeedBump
        self.whoCanShareContactCard = whoCanShareContactCard
        self.slackConnectInviteShouldBadgeSidebar = slackConnectInviteShouldBadgeSidebar
        self.phcDismissed = phcDismissed
        self.dismissedGovSlackFirstTimePopup = dismissedGovSlackFirstTimePopup
        self.mobileChannelListSort = mobileChannelListSort
        self.userExpectationsSurveyLastTriggerAttempt = userExpectationsSurveyLastTriggerAttempt
        self.localesEnabled = localesEnabled
        self.phcViewed = phcViewed
        self.seenA11yPrefSetupCoachmark = seenA11yPrefSetupCoachmark
        self.enableFileBrowserViewForDocs = enableFileBrowserViewForDocs
        self.enableShortcutsView = enableShortcutsView
        self.showGovSlackContextBarBanner = showGovSlackContextBarBanner
        self.whoCanSeeAccountBySearchingEmail = whoCanSeeAccountBySearchingEmail
        self.contextualHelpResetCount = contextualHelpResetCount
        self.mobileChannelListShowAllDms = mobileChannelListShowAllDms
        self.enableQuipFileBrowserView = enableQuipFileBrowserView
        self.a11yPlaySoundForIncomingDmChoice = a11yPlaySoundForIncomingDmChoice
        self.a11yPlaySoundForSentDmChoice = a11yPlaySoundForSentDmChoice
        self.onboardingTipOptOut = onboardingTipOptOut
        self.seenOnboardingSynthView = seenOnboardingSynthView
        self.enableDraftsView = enableDraftsView
        self.enableScheduledView = enableScheduledView
        self.seenSentPageInSidebar = seenSentPageInSidebar
        self.firstSeenSentPageInSidebar = firstSeenSentPageInSidebar
        self.seenNewBadgeInMoreMenuSidebar = seenNewBadgeInMoreMenuSidebar
        self.firstSeenNewBadgeInMoreMenuSidebar = firstSeenNewBadgeInMoreMenuSidebar
        self.seenOnboardingSynthViewCount = seenOnboardingSynthViewCount
        self.synthViewPrefs = synthViewPrefs
        self.clipsFeedbackSurveyLastTriggerAttempt = clipsFeedbackSurveyLastTriggerAttempt
        self.enableLaterView = enableLaterView
        self.hasJoinedHuddle = hasJoinedHuddle
        self.hasSentTenMessages = hasSentTenMessages
        self.suppressThreadMentionWarning = suppressThreadMentionWarning
        self.hiddenUsers = hiddenUsers
        self.dismissedSentPageEducation = dismissedSentPageEducation
        self.seenOnboardingSynthViewV2 = seenOnboardingSynthViewV2
        self.clickedCloseOnboardingSynthViewBanner = clickedCloseOnboardingSynthViewBanner
        self.seenOnboardingSynthViewCountV2 = seenOnboardingSynthViewCountV2
        self.appManifestSchemaFormat = appManifestSchemaFormat
        self.channelCanvasVariant = channelCanvasVariant
    }
}
