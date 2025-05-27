import Foundation

public struct Container: Codable, Hashable, Sendable {
    public let _type: String = "view"
    public let viewId: String

    public init(viewId: String) {
        self.viewId = viewId
    }

    private enum CodingKeys: String, CodingKey {
        case _type = "type"
        case viewId = "view_id"
    }
}
