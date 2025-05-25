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

/// - Remark: Generated from `#/components/schemas/Organization`.
public struct Organization: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Organization/canvas`.
    public var canvas: SlackModels.Canvas?
    /// - Remark: Generated from `#/components/schemas/Organization/lists`.
    public var lists: SlackModels.Canvas?
    /// - Remark: Generated from `#/components/schemas/Organization/teamId`.
    public var teamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Organization/teamName`.
    public var teamName: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Organization/teamDomain`.
    public var teamDomain: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Organization/publicChannelCount`.
    public var publicChannelCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Organization/privateChannelCount`.
    public var privateChannelCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Organization/imChannelCount`.
    public var imChannelCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Organization/mpimChannelCount`.
    public var mpimChannelCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Organization/connectedWorkspaces`.
    public var connectedWorkspaces: [SlackModels.ConnectedWorkspace]?
    /// - Remark: Generated from `#/components/schemas/Organization/slackConnectPrefs`.
    public var slackConnectPrefs: SlackModels.SlackConnectPrefs?
    /// - Remark: Generated from `#/components/schemas/Organization/connectionStatus`.
    public var connectionStatus: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Organization/lastActiveTimestamp`.
    public var lastActiveTimestamp: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Organization/isSponsored`.
    public var isSponsored: Swift.Bool?
    /// Creates a new `Organization`.
    ///
    /// - Parameters:
    ///   - canvas:
    ///   - lists:
    ///   - teamId:
    ///   - teamName:
    ///   - teamDomain:
    ///   - publicChannelCount:
    ///   - privateChannelCount:
    ///   - imChannelCount:
    ///   - mpimChannelCount:
    ///   - connectedWorkspaces:
    ///   - slackConnectPrefs:
    ///   - connectionStatus:
    ///   - lastActiveTimestamp:
    ///   - isSponsored:
    public init(
        canvas: SlackModels.Canvas? = nil,
        lists: SlackModels.Canvas? = nil,
        teamId: Swift.String? = nil,
        teamName: Swift.String? = nil,
        teamDomain: Swift.String? = nil,
        publicChannelCount: Swift.Int? = nil,
        privateChannelCount: Swift.Int? = nil,
        imChannelCount: Swift.Int? = nil,
        mpimChannelCount: Swift.Int? = nil,
        connectedWorkspaces: [SlackModels.ConnectedWorkspace]? = nil,
        slackConnectPrefs: SlackModels.SlackConnectPrefs? = nil,
        connectionStatus: Swift.String? = nil,
        lastActiveTimestamp: Swift.Int? = nil,
        isSponsored: Swift.Bool? = nil
    ) {
        self.canvas = canvas
        self.lists = lists
        self.teamId = teamId
        self.teamName = teamName
        self.teamDomain = teamDomain
        self.publicChannelCount = publicChannelCount
        self.privateChannelCount = privateChannelCount
        self.imChannelCount = imChannelCount
        self.mpimChannelCount = mpimChannelCount
        self.connectedWorkspaces = connectedWorkspaces
        self.slackConnectPrefs = slackConnectPrefs
        self.connectionStatus = connectionStatus
        self.lastActiveTimestamp = lastActiveTimestamp
        self.isSponsored = isSponsored
    }
}
