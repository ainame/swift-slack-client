@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
@preconcurrency import struct Foundation.Data
@preconcurrency import struct Foundation.Date
@preconcurrency import struct Foundation.URL
#else
import struct Foundation.Data
import struct Foundation.Date
import struct Foundation.URL
#endif

/// - Remark: Generated from `#/components/schemas/Organization`.
public struct Organization: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Organization/canvas`.
    public var canvas: Canvas?
    /// - Remark: Generated from `#/components/schemas/Organization/connected_workspaces`.
    public var connectedWorkspaces: [ConnectedWorkspace]?
    /// - Remark: Generated from `#/components/schemas/Organization/connection_status`.
    public var connectionStatus: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Organization/im_channel_count`.
    public var imChannelCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Organization/is_sponsored`.
    public var isSponsored: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Organization/last_active_timestamp`.
    public var lastActiveTimestamp: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Organization/lists`.
    public var lists: Canvas?
    /// - Remark: Generated from `#/components/schemas/Organization/mpim_channel_count`.
    public var mpimChannelCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Organization/private_channel_count`.
    public var privateChannelCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Organization/public_channel_count`.
    public var publicChannelCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Organization/slack_connect_prefs`.
    public var slackConnectPrefs: SlackConnectPrefs?
    /// - Remark: Generated from `#/components/schemas/Organization/team_domain`.
    public var teamDomain: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Organization/team_id`.
    public var teamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Organization/team_name`.
    public var teamName: Swift.String?
    /// Creates a new `Organization`.
    ///
    /// - Parameters:
    ///   - canvas:
    ///   - connectedWorkspaces:
    ///   - connectionStatus:
    ///   - imChannelCount:
    ///   - isSponsored:
    ///   - lastActiveTimestamp:
    ///   - lists:
    ///   - mpimChannelCount:
    ///   - privateChannelCount:
    ///   - publicChannelCount:
    ///   - slackConnectPrefs:
    ///   - teamDomain:
    ///   - teamId:
    ///   - teamName:
    public init(
        canvas: Canvas? = nil,
        connectedWorkspaces: [ConnectedWorkspace]? = nil,
        connectionStatus: Swift.String? = nil,
        imChannelCount: Swift.Int? = nil,
        isSponsored: Swift.Bool? = nil,
        lastActiveTimestamp: Swift.Int? = nil,
        lists: Canvas? = nil,
        mpimChannelCount: Swift.Int? = nil,
        privateChannelCount: Swift.Int? = nil,
        publicChannelCount: Swift.Int? = nil,
        slackConnectPrefs: SlackConnectPrefs? = nil,
        teamDomain: Swift.String? = nil,
        teamId: Swift.String? = nil,
        teamName: Swift.String? = nil,
    ) {
        self.canvas = canvas
        self.connectedWorkspaces = connectedWorkspaces
        self.connectionStatus = connectionStatus
        self.imChannelCount = imChannelCount
        self.isSponsored = isSponsored
        self.lastActiveTimestamp = lastActiveTimestamp
        self.lists = lists
        self.mpimChannelCount = mpimChannelCount
        self.privateChannelCount = privateChannelCount
        self.publicChannelCount = publicChannelCount
        self.slackConnectPrefs = slackConnectPrefs
        self.teamDomain = teamDomain
        self.teamId = teamId
        self.teamName = teamName
    }

    public enum CodingKeys: String, CodingKey {
        case canvas
        case connectedWorkspaces = "connected_workspaces"
        case connectionStatus = "connection_status"
        case imChannelCount = "im_channel_count"
        case isSponsored = "is_sponsored"
        case lastActiveTimestamp = "last_active_timestamp"
        case lists
        case mpimChannelCount = "mpim_channel_count"
        case privateChannelCount = "private_channel_count"
        case publicChannelCount = "public_channel_count"
        case slackConnectPrefs = "slack_connect_prefs"
        case teamDomain = "team_domain"
        case teamId = "team_id"
        case teamName = "team_name"
    }
}
