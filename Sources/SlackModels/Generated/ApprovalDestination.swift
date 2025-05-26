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
        channelId: Swift.String? = nil
    ) {
        self.allWhoCanManageSharedChannels = allWhoCanManageSharedChannels
        self.channelId = channelId
    }
}
