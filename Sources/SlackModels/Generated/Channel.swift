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

/// - Remark: Generated from `#/components/schemas/Channel`.
public struct Channel: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Channel/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Channel/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Channel/created`.
    public var created: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Channel/unlinked`.
    public var unlinked: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Channel/creator`.
    public var creator: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Channel/topic`.
    public var topic: SlackModels.Purpose?
    /// - Remark: Generated from `#/components/schemas/Channel/purpose`.
    public var purpose: SlackModels.Purpose?
    /// - Remark: Generated from `#/components/schemas/Channel/priority`.
    public var priority: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Channel/user`.
    public var user: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Channel/updated`.
    public var updated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Channel/properties`.
    public var properties: SlackModels.Properties?
    /// - Remark: Generated from `#/components/schemas/Channel/isChannel`.
    public var isChannel: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Channel/isGroup`.
    public var isGroup: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Channel/isIm`.
    public var isIm: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Channel/isArchived`.
    public var isArchived: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Channel/isGeneral`.
    public var isGeneral: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Channel/nameNormalized`.
    public var nameNormalized: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Channel/isShared`.
    public var isShared: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Channel/isExtShared`.
    public var isExtShared: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Channel/isOrgShared`.
    public var isOrgShared: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Channel/sharedTeamIds`.
    public var sharedTeamIds: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Channel/pendingShared`.
    public var pendingShared: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Channel/pendingConnectedTeamIds`.
    public var pendingConnectedTeamIds: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Channel/isPendingExtShared`.
    public var isPendingExtShared: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Channel/isPrivate`.
    public var isPrivate: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Channel/isMpim`.
    public var isMpim: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Channel/previousNames`.
    public var previousNames: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Channel/conversationHostId`.
    public var conversationHostId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Channel/isMoved`.
    public var isMoved: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Channel/internalTeamIds`.
    public var internalTeamIds: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Channel/isGlobalShared`.
    public var isGlobalShared: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Channel/isOrgDefault`.
    public var isOrgDefault: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Channel/isOrgMandatory`.
    public var isOrgMandatory: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Channel/enterpriseId`.
    public var enterpriseId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Channel/lastRead`.
    public var lastRead: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Channel/isOpen`.
    public var isOpen: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Channel/isUserDeleted`.
    public var isUserDeleted: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Channel/parentConversation`.
    public var parentConversation: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Channel/contextTeamId`.
    public var contextTeamId: Swift.String?
    /// Creates a new `Channel`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - name:
    ///   - created:
    ///   - unlinked:
    ///   - creator:
    ///   - topic:
    ///   - purpose:
    ///   - priority:
    ///   - user:
    ///   - updated:
    ///   - properties:
    ///   - isChannel:
    ///   - isGroup:
    ///   - isIm:
    ///   - isArchived:
    ///   - isGeneral:
    ///   - nameNormalized:
    ///   - isShared:
    ///   - isExtShared:
    ///   - isOrgShared:
    ///   - sharedTeamIds:
    ///   - pendingShared:
    ///   - pendingConnectedTeamIds:
    ///   - isPendingExtShared:
    ///   - isPrivate:
    ///   - isMpim:
    ///   - previousNames:
    ///   - conversationHostId:
    ///   - isMoved:
    ///   - internalTeamIds:
    ///   - isGlobalShared:
    ///   - isOrgDefault:
    ///   - isOrgMandatory:
    ///   - enterpriseId:
    ///   - lastRead:
    ///   - isOpen:
    ///   - isUserDeleted:
    ///   - parentConversation:
    ///   - contextTeamId:
    public init(
        id: Swift.String? = nil,
        name: Swift.String? = nil,
        created: Swift.Int? = nil,
        unlinked: Swift.Int? = nil,
        creator: Swift.String? = nil,
        topic: SlackModels.Purpose? = nil,
        purpose: SlackModels.Purpose? = nil,
        priority: Swift.Int? = nil,
        user: Swift.String? = nil,
        updated: Swift.Int? = nil,
        properties: SlackModels.Properties? = nil,
        isChannel: Swift.Bool? = nil,
        isGroup: Swift.Bool? = nil,
        isIm: Swift.Bool? = nil,
        isArchived: Swift.Bool? = nil,
        isGeneral: Swift.Bool? = nil,
        nameNormalized: Swift.String? = nil,
        isShared: Swift.Bool? = nil,
        isExtShared: Swift.Bool? = nil,
        isOrgShared: Swift.Bool? = nil,
        sharedTeamIds: [Swift.String]? = nil,
        pendingShared: [Swift.String]? = nil,
        pendingConnectedTeamIds: [Swift.String]? = nil,
        isPendingExtShared: Swift.Bool? = nil,
        isPrivate: Swift.Bool? = nil,
        isMpim: Swift.Bool? = nil,
        previousNames: [Swift.String]? = nil,
        conversationHostId: Swift.String? = nil,
        isMoved: Swift.Int? = nil,
        internalTeamIds: [Swift.String]? = nil,
        isGlobalShared: Swift.Bool? = nil,
        isOrgDefault: Swift.Bool? = nil,
        isOrgMandatory: Swift.Bool? = nil,
        enterpriseId: Swift.String? = nil,
        lastRead: Swift.String? = nil,
        isOpen: Swift.Bool? = nil,
        isUserDeleted: Swift.Bool? = nil,
        parentConversation: Swift.String? = nil,
        contextTeamId: Swift.String? = nil
    ) {
        self.id = id
        self.name = name
        self.created = created
        self.unlinked = unlinked
        self.creator = creator
        self.topic = topic
        self.purpose = purpose
        self.priority = priority
        self.user = user
        self.updated = updated
        self.properties = properties
        self.isChannel = isChannel
        self.isGroup = isGroup
        self.isIm = isIm
        self.isArchived = isArchived
        self.isGeneral = isGeneral
        self.nameNormalized = nameNormalized
        self.isShared = isShared
        self.isExtShared = isExtShared
        self.isOrgShared = isOrgShared
        self.sharedTeamIds = sharedTeamIds
        self.pendingShared = pendingShared
        self.pendingConnectedTeamIds = pendingConnectedTeamIds
        self.isPendingExtShared = isPendingExtShared
        self.isPrivate = isPrivate
        self.isMpim = isMpim
        self.previousNames = previousNames
        self.conversationHostId = conversationHostId
        self.isMoved = isMoved
        self.internalTeamIds = internalTeamIds
        self.isGlobalShared = isGlobalShared
        self.isOrgDefault = isOrgDefault
        self.isOrgMandatory = isOrgMandatory
        self.enterpriseId = enterpriseId
        self.lastRead = lastRead
        self.isOpen = isOpen
        self.isUserDeleted = isUserDeleted
        self.parentConversation = parentConversation
        self.contextTeamId = contextTeamId
    }
}
