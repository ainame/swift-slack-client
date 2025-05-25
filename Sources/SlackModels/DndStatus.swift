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
}
