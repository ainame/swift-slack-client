@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
@preconcurrency import struct Foundation.Data
@preconcurrency import struct Foundation.Date
@preconcurrency import struct Foundation.URL
#else
import struct Foundation.Data
import struct Foundation.Date
import struct Foundation.URL
#endif

/// - Remark: Generated from `#/components/schemas/Messages`.
public struct Messages: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Messages/matches`.
    public var matches: [Match]?
    /// - Remark: Generated from `#/components/schemas/Messages/pagination`.
    public var pagination: Pagination?
    /// - Remark: Generated from `#/components/schemas/Messages/paging`.
    public var paging: Paging?
    /// - Remark: Generated from `#/components/schemas/Messages/total`.
    public var total: Swift.Int?
    /// Creates a new `Messages`.
    ///
    /// - Parameters:
    ///   - matches:
    ///   - pagination:
    ///   - paging:
    ///   - total:
    public init(
        matches: [Match]? = nil,
        pagination: Pagination? = nil,
        paging: Paging? = nil,
        total: Swift.Int? = nil,
    ) {
        self.matches = matches
        self.pagination = pagination
        self.paging = paging
        self.total = total
    }

    public enum CodingKeys: String, CodingKey {
        case matches
        case pagination
        case paging
        case total
    }
}
