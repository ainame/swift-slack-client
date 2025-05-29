import Foundation

public struct DndStatus: Codable, Hashable, Sendable {
    public var dndEnabled: Swift.Bool?
    public var nextDndStartTs: Swift.Int?
    public var nextDndEndTs: Swift.Int?

    public init(
        dndEnabled: Swift.Bool? = nil,
        nextDndStartTs: Swift.Int? = nil,
        nextDndEndTs: Swift.Int? = nil
    ) {
        self.dndEnabled = dndEnabled
        self.nextDndStartTs = nextDndStartTs
        self.nextDndEndTs = nextDndEndTs
    }

    private enum CodingKeys: String, CodingKey {
        case dndEnabled = "dnd_enabled"
        case nextDndStartTs = "next_dnd_start_ts"
        case nextDndEndTs = "next_dnd_end_ts"
    }
}
