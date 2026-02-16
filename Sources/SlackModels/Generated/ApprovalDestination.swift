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

/// - Remark: Generated from `#/components/schemas/ApprovalDestination`.
public struct ApprovalDestination: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ApprovalDestination/all_who_can_manage_shared_channels`.
    public var allWhoCanManageSharedChannels: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/ApprovalDestination/channel_id`.
    public var channelId: Swift.String?
    /// Creates a new `ApprovalDestination`.
    ///
    /// - Parameters:
    ///   - allWhoCanManageSharedChannels:
    ///   - channelId:
    public init(
        allWhoCanManageSharedChannels: Swift.Bool? = nil,
        channelId: Swift.String? = nil,
    ) {
        self.allWhoCanManageSharedChannels = allWhoCanManageSharedChannels
        self.channelId = channelId
    }

    public enum CodingKeys: String, CodingKey {
        case allWhoCanManageSharedChannels = "all_who_can_manage_shared_channels"
        case channelId = "channel_id"
    }
}
