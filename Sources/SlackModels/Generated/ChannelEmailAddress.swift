@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/ChannelEmailAddress`.
public struct ChannelEmailAddress: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ChannelEmailAddress/address`.
    public var address: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ChannelEmailAddress/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ChannelEmailAddress/icons`.
    public var icons: Icons?
    /// - Remark: Generated from `#/components/schemas/ChannelEmailAddress/teamId`.
    public var teamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ChannelEmailAddress/userId`.
    public var userId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ChannelEmailAddress/conversationId`.
    public var conversationId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ChannelEmailAddress/dateCreated`.
    public var dateCreated: Swift.Int?
    /// Creates a new `ChannelEmailAddress`.
    ///
    /// - Parameters:
    ///   - address:
    ///   - name:
    ///   - icons:
    ///   - teamId:
    ///   - userId:
    ///   - conversationId:
    ///   - dateCreated:
    public init(
        address: Swift.String? = nil,
        name: Swift.String? = nil,
        icons: Icons? = nil,
        teamId: Swift.String? = nil,
        userId: Swift.String? = nil,
        conversationId: Swift.String? = nil,
        dateCreated: Swift.Int? = nil
    ) {
        self.address = address
        self.name = name
        self.icons = icons
        self.teamId = teamId
        self.userId = userId
        self.conversationId = conversationId
        self.dateCreated = dateCreated
    }
}
