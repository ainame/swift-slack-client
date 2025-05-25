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
    /// - Remark: Generated from `#/components/schemas/Conversation/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Conversation/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Conversation/purpose`.
    public var purpose: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Conversation/created`.
    public var created: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Conversation/canvas`.
    public var canvas: ListsClass?
    /// - Remark: Generated from `#/components/schemas/Conversation/lists`.
    public var lists: ListsClass?
    /// - Remark: Generated from `#/components/schemas/Conversation/properties`.
    public var properties: Properties?
    /// - Remark: Generated from `#/components/schemas/Conversation/memberCount`.
    public var memberCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Conversation/creatorId`.
    public var creatorId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Conversation/isPrivate`.
    public var isPrivate: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Conversation/isArchived`.
    public var isArchived: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Conversation/isGeneral`.
    public var isGeneral: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Conversation/lastActivityTs`.
    public var lastActivityTs: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Conversation/isExtShared`.
    public var isExtShared: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Conversation/isGlobalShared`.
    public var isGlobalShared: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Conversation/isOrgDefault`.
    public var isOrgDefault: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Conversation/isOrgMandatory`.
    public var isOrgMandatory: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Conversation/isOrgShared`.
    public var isOrgShared: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Conversation/isFrozen`.
    public var isFrozen: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Conversation/internalTeamIdsCount`.
    public var internalTeamIdsCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Conversation/internalTeamIdsSampleTeam`.
    public var internalTeamIdsSampleTeam: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Conversation/pendingConnectedTeamIds`.
    public var pendingConnectedTeamIds: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Conversation/isPendingExtShared`.
    public var isPendingExtShared: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Conversation/connectedTeamIds`.
    public var connectedTeamIds: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Conversation/conversationHostId`.
    public var conversationHostId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Conversation/channelEmailAddresses`.
    public var channelEmailAddresses: [ChannelEmailAddress]?
    /// - Remark: Generated from `#/components/schemas/Conversation/connectedLimitedTeamIds`.
    public var connectedLimitedTeamIds: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Conversation/externalUserCount`.
    public var externalUserCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Conversation/internalTeamIds`.
    public var internalTeamIds: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Conversation/channelManagerCount`.
    public var channelManagerCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Conversation/isDisconnectInProgress`.
    public var isDisconnectInProgress: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Conversation/contextTeamId`.
    public var contextTeamId: Swift.String?
    /// Creates a new `Conversation`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - name:
    ///   - purpose:
    ///   - created:
    ///   - canvas:
    ///   - lists:
    ///   - properties:
    ///   - memberCount:
    ///   - creatorId:
    ///   - isPrivate:
    ///   - isArchived:
    ///   - isGeneral:
    ///   - lastActivityTs:
    ///   - isExtShared:
    ///   - isGlobalShared:
    ///   - isOrgDefault:
    ///   - isOrgMandatory:
    ///   - isOrgShared:
    ///   - isFrozen:
    ///   - internalTeamIdsCount:
    ///   - internalTeamIdsSampleTeam:
    ///   - pendingConnectedTeamIds:
    ///   - isPendingExtShared:
    ///   - connectedTeamIds:
    ///   - conversationHostId:
    ///   - channelEmailAddresses:
    ///   - connectedLimitedTeamIds:
    ///   - externalUserCount:
    ///   - internalTeamIds:
    ///   - channelManagerCount:
    ///   - isDisconnectInProgress:
    ///   - contextTeamId:
    public init(
        id: Swift.String? = nil,
        name: Swift.String? = nil,
        purpose: Swift.String? = nil,
        created: Swift.Int? = nil,
        canvas: ListsClass? = nil,
        lists: ListsClass? = nil,
        properties: Properties? = nil,
        memberCount: Swift.Int? = nil,
        creatorId: Swift.String? = nil,
        isPrivate: Swift.Bool? = nil,
        isArchived: Swift.Bool? = nil,
        isGeneral: Swift.Bool? = nil,
        lastActivityTs: Swift.Int? = nil,
        isExtShared: Swift.Bool? = nil,
        isGlobalShared: Swift.Bool? = nil,
        isOrgDefault: Swift.Bool? = nil,
        isOrgMandatory: Swift.Bool? = nil,
        isOrgShared: Swift.Bool? = nil,
        isFrozen: Swift.Bool? = nil,
        internalTeamIdsCount: Swift.Int? = nil,
        internalTeamIdsSampleTeam: Swift.String? = nil,
        pendingConnectedTeamIds: [Swift.String]? = nil,
        isPendingExtShared: Swift.Bool? = nil,
        connectedTeamIds: [Swift.String]? = nil,
        conversationHostId: Swift.String? = nil,
        channelEmailAddresses: [ChannelEmailAddress]? = nil,
        connectedLimitedTeamIds: [Swift.String]? = nil,
        externalUserCount: Swift.Int? = nil,
        internalTeamIds: [Swift.String]? = nil,
        channelManagerCount: Swift.Int? = nil,
        isDisconnectInProgress: Swift.Bool? = nil,
        contextTeamId: Swift.String? = nil
    ) {
        self.id = id
        self.name = name
        self.purpose = purpose
        self.created = created
        self.canvas = canvas
        self.lists = lists
        self.properties = properties
        self.memberCount = memberCount
        self.creatorId = creatorId
        self.isPrivate = isPrivate
        self.isArchived = isArchived
        self.isGeneral = isGeneral
        self.lastActivityTs = lastActivityTs
        self.isExtShared = isExtShared
        self.isGlobalShared = isGlobalShared
        self.isOrgDefault = isOrgDefault
        self.isOrgMandatory = isOrgMandatory
        self.isOrgShared = isOrgShared
        self.isFrozen = isFrozen
        self.internalTeamIdsCount = internalTeamIdsCount
        self.internalTeamIdsSampleTeam = internalTeamIdsSampleTeam
        self.pendingConnectedTeamIds = pendingConnectedTeamIds
        self.isPendingExtShared = isPendingExtShared
        self.connectedTeamIds = connectedTeamIds
        self.conversationHostId = conversationHostId
        self.channelEmailAddresses = channelEmailAddresses
        self.connectedLimitedTeamIds = connectedLimitedTeamIds
        self.externalUserCount = externalUserCount
        self.internalTeamIds = internalTeamIds
        self.channelManagerCount = channelManagerCount
        self.isDisconnectInProgress = isDisconnectInProgress
        self.contextTeamId = contextTeamId
    }
}
