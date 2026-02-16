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

/// - Remark: Generated from `#/components/schemas/Reaction`.
public struct Reaction: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Reaction/count`.
    public var count: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Reaction/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Reaction/url`.
    public var url: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Reaction/users`.
    public var users: [Swift.String]?
    /// Creates a new `Reaction`.
    ///
    /// - Parameters:
    ///   - count:
    ///   - name:
    ///   - url:
    ///   - users:
    public init(
        count: Swift.Int? = nil,
        name: Swift.String? = nil,
        url: Swift.String? = nil,
        users: [Swift.String]? = nil
    ) {
        self.count = count
        self.name = name
        self.url = url
        self.users = users
    }
    public enum CodingKeys: String, CodingKey {
        case count
        case name
        case url
        case users
    }
}
