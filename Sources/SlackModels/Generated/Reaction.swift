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

/// - Remark: Generated from `#/components/schemas/Reaction`.
public struct Reaction: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Reaction/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Reaction/count`.
    public var count: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Reaction/users`.
    public var users: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/Reaction/url`.
    public var url: Swift.String?
    /// Creates a new `Reaction`.
    ///
    /// - Parameters:
    ///   - name:
    ///   - count:
    ///   - users:
    ///   - url:
    public init(
        name: Swift.String? = nil,
        count: Swift.Int? = nil,
        users: [Swift.String]? = nil,
        url: Swift.String? = nil
    ) {
        self.name = name
        self.count = count
        self.users = users
        self.url = url
    }
}
