import Foundation

public struct PinnedInfo: Codable, Hashable, Sendable {
    public var channel: Swift.String?
    public var pinnedBy: Swift.String?
    public var pinnedTs: Swift.Int?

    public init(
        channel: Swift.String? = nil,
        pinnedBy: Swift.String? = nil,
        pinnedTs: Swift.Int? = nil
    ) {
        self.channel = channel
        self.pinnedBy = pinnedBy
        self.pinnedTs = pinnedTs
    }
}
