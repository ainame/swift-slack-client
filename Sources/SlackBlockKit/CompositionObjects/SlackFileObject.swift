import Foundation

public struct SlackFileObject: Codable, Hashable, Sendable {
    public let url: URL?
    public let id: String?

    public init(url: URL? = nil, id: String? = nil) {
        self.url = url
        self.id = id
    }
}
