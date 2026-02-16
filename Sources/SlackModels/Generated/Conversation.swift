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

/// - Remark: Generated from `#/components/schemas/Conversation`.
public struct Conversation: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Conversation/canvas`.
    public var canvas: ListsClass?
    /// - Remark: Generated from `#/components/schemas/Conversation/channel_email_addresses`.
    public var channelEmailAddresses: [ChannelEmailAddress]?
    /// - Remark: Generated from `#/components/schemas/Conversation/channel_manager_count`.
    public var channelManagerCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Conversation/connected_limited_team_ids`.
    public var connectedLimitedTeamIds: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Conversation/connected_team_ids`.
    public var connectedTeamIds: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Conversation/context_team_id`.
    public var contextTeamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Conversation/conversation_host_id`.
    public var conversationHostId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Conversation/created`.
    public var created: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Conversation/creator_id`.
    public var creatorId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Conversation/external_user_count`.
    public var externalUserCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Conversation/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Conversation/internal_team_ids`.
    public var internalTeamIds: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Conversation/internal_team_ids_count`.
    public var internalTeamIdsCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Conversation/internal_team_ids_sample_team`.
    public var internalTeamIdsSampleTeam: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Conversation/is_archived`.
    public var isArchived: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Conversation/is_disconnect_in_progress`.
    public var isDisconnectInProgress: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Conversation/is_ext_shared`.
    public var isExtShared: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Conversation/is_frozen`.
    public var isFrozen: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Conversation/is_general`.
    public var isGeneral: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Conversation/is_global_shared`.
    public var isGlobalShared: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Conversation/is_org_default`.
    public var isOrgDefault: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Conversation/is_org_mandatory`.
    public var isOrgMandatory: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Conversation/is_org_shared`.
    public var isOrgShared: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Conversation/is_pending_ext_shared`.
    public var isPendingExtShared: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Conversation/is_private`.
    public var isPrivate: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Conversation/last_activity_ts`.
    public var lastActivityTs: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Conversation/lists`.
    public var lists: ListsClass?
    /// - Remark: Generated from `#/components/schemas/Conversation/member_count`.
    public var memberCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Conversation/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Conversation/pending_connected_team_ids`.
    public var pendingConnectedTeamIds: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Conversation/properties`.
    public var properties: Properties?
    /// - Remark: Generated from `#/components/schemas/Conversation/purpose`.
    public var purpose: Swift.String?
    /// Creates a new `Conversation`.
    ///
    /// - Parameters:
    ///   - canvas:
    ///   - channelEmailAddresses:
    ///   - channelManagerCount:
    ///   - connectedLimitedTeamIds:
    ///   - connectedTeamIds:
    ///   - contextTeamId:
    ///   - conversationHostId:
    ///   - created:
    ///   - creatorId:
    ///   - externalUserCount:
    ///   - id:
    ///   - internalTeamIds:
    ///   - internalTeamIdsCount:
    ///   - internalTeamIdsSampleTeam:
    ///   - isArchived:
    ///   - isDisconnectInProgress:
    ///   - isExtShared:
    ///   - isFrozen:
    ///   - isGeneral:
    ///   - isGlobalShared:
    ///   - isOrgDefault:
    ///   - isOrgMandatory:
    ///   - isOrgShared:
    ///   - isPendingExtShared:
    ///   - isPrivate:
    ///   - lastActivityTs:
    ///   - lists:
    ///   - memberCount:
    ///   - name:
    ///   - pendingConnectedTeamIds:
    ///   - properties:
    ///   - purpose:
    public init(
        canvas: ListsClass? = nil,
        channelEmailAddresses: [ChannelEmailAddress]? = nil,
        channelManagerCount: Swift.Int? = nil,
        connectedLimitedTeamIds: [Swift.String]? = nil,
        connectedTeamIds: [Swift.String]? = nil,
        contextTeamId: Swift.String? = nil,
        conversationHostId: Swift.String? = nil,
        created: Swift.Int? = nil,
        creatorId: Swift.String? = nil,
        externalUserCount: Swift.Int? = nil,
        id: Swift.String? = nil,
        internalTeamIds: [Swift.String]? = nil,
        internalTeamIdsCount: Swift.Int? = nil,
        internalTeamIdsSampleTeam: Swift.String? = nil,
        isArchived: Swift.Bool? = nil,
        isDisconnectInProgress: Swift.Bool? = nil,
        isExtShared: Swift.Bool? = nil,
        isFrozen: Swift.Bool? = nil,
        isGeneral: Swift.Bool? = nil,
        isGlobalShared: Swift.Bool? = nil,
        isOrgDefault: Swift.Bool? = nil,
        isOrgMandatory: Swift.Bool? = nil,
        isOrgShared: Swift.Bool? = nil,
        isPendingExtShared: Swift.Bool? = nil,
        isPrivate: Swift.Bool? = nil,
        lastActivityTs: Swift.Int? = nil,
        lists: ListsClass? = nil,
        memberCount: Swift.Int? = nil,
        name: Swift.String? = nil,
        pendingConnectedTeamIds: [Swift.String]? = nil,
        properties: Properties? = nil,
        purpose: Swift.String? = nil
    ) {
        self.canvas = canvas
        self.channelEmailAddresses = channelEmailAddresses
        self.channelManagerCount = channelManagerCount
        self.connectedLimitedTeamIds = connectedLimitedTeamIds
        self.connectedTeamIds = connectedTeamIds
        self.contextTeamId = contextTeamId
        self.conversationHostId = conversationHostId
        self.created = created
        self.creatorId = creatorId
        self.externalUserCount = externalUserCount
        self.id = id
        self.internalTeamIds = internalTeamIds
        self.internalTeamIdsCount = internalTeamIdsCount
        self.internalTeamIdsSampleTeam = internalTeamIdsSampleTeam
        self.isArchived = isArchived
        self.isDisconnectInProgress = isDisconnectInProgress
        self.isExtShared = isExtShared
        self.isFrozen = isFrozen
        self.isGeneral = isGeneral
        self.isGlobalShared = isGlobalShared
        self.isOrgDefault = isOrgDefault
        self.isOrgMandatory = isOrgMandatory
        self.isOrgShared = isOrgShared
        self.isPendingExtShared = isPendingExtShared
        self.isPrivate = isPrivate
        self.lastActivityTs = lastActivityTs
        self.lists = lists
        self.memberCount = memberCount
        self.name = name
        self.pendingConnectedTeamIds = pendingConnectedTeamIds
        self.properties = properties
        self.purpose = purpose
    }
    public enum CodingKeys: String, CodingKey {
        case canvas
        case channelEmailAddresses = "channel_email_addresses"
        case channelManagerCount = "channel_manager_count"
        case connectedLimitedTeamIds = "connected_limited_team_ids"
        case connectedTeamIds = "connected_team_ids"
        case contextTeamId = "context_team_id"
        case conversationHostId = "conversation_host_id"
        case created
        case creatorId = "creator_id"
        case externalUserCount = "external_user_count"
        case id
        case internalTeamIds = "internal_team_ids"
        case internalTeamIdsCount = "internal_team_ids_count"
        case internalTeamIdsSampleTeam = "internal_team_ids_sample_team"
        case isArchived = "is_archived"
        case isDisconnectInProgress = "is_disconnect_in_progress"
        case isExtShared = "is_ext_shared"
        case isFrozen = "is_frozen"
        case isGeneral = "is_general"
        case isGlobalShared = "is_global_shared"
        case isOrgDefault = "is_org_default"
        case isOrgMandatory = "is_org_mandatory"
        case isOrgShared = "is_org_shared"
        case isPendingExtShared = "is_pending_ext_shared"
        case isPrivate = "is_private"
        case lastActivityTs = "last_activity_ts"
        case lists
        case memberCount = "member_count"
        case name
        case pendingConnectedTeamIds = "pending_connected_team_ids"
        case properties
        case purpose
    }
}
