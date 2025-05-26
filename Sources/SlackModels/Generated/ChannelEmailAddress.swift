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

/// - Remark: Generated from `#/components/schemas/ChannelEmailAddress`.
public struct ChannelEmailAddress: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ChannelEmailAddress/address`.
    public var address: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ChannelEmailAddress/conversation_id`.
    public var conversationId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ChannelEmailAddress/date_created`.
    public var dateCreated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/ChannelEmailAddress/icons`.
    public var icons: Icons?
    /// - Remark: Generated from `#/components/schemas/ChannelEmailAddress/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ChannelEmailAddress/team_id`.
    public var teamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ChannelEmailAddress/user_id`.
    public var userId: Swift.String?
    /// Creates a new `ChannelEmailAddress`.
    ///
    /// - Parameters:
    ///   - address:
    ///   - conversationId:
    ///   - dateCreated:
    ///   - icons:
    ///   - name:
    ///   - teamId:
    ///   - userId:
    public init(
        address: Swift.String? = nil,
        conversationId: Swift.String? = nil,
        dateCreated: Swift.Int? = nil,
        icons: Icons? = nil,
        name: Swift.String? = nil,
        teamId: Swift.String? = nil,
        userId: Swift.String? = nil
    ) {
        self.address = address
        self.conversationId = conversationId
        self.dateCreated = dateCreated
        self.icons = icons
        self.name = name
        self.teamId = teamId
        self.userId = userId
    }
}
