import Foundation

public struct Link: Codable, Hashable, Sendable {
    public var domain: Swift.String?
    public var url: Swift.String?

    public init(
        domain: Swift.String? = nil,
        url: Swift.String? = nil
    ) {
        self.domain = domain
        self.url = url
    }
}
