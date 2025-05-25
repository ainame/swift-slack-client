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

/// - Remark: Generated from `#/components/schemas/ApprovalDestination`.
public struct ApprovalDestination: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ApprovalDestination/allWhoCanManageSharedChannels`.
    public var allWhoCanManageSharedChannels: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/ApprovalDestination/channelId`.
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
