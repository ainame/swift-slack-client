@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/Messages`.
public struct Messages: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Messages/total`.
    public var total: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Messages/pagination`.
    public var pagination: Pagination?
    /// - Remark: Generated from `#/components/schemas/Messages/paging`.
    public var paging: Paging?
    /// - Remark: Generated from `#/components/schemas/Messages/matches`.
    public var matches: [Match]?
    /// Creates a new `Messages`.
    ///
    /// - Parameters:
    ///   - total:
    ///   - pagination:
    ///   - paging:
    ///   - matches:
    public init(
        total: Swift.Int? = nil,
        pagination: Pagination? = nil,
        paging: Paging? = nil,
        matches: [Match]? = nil
    ) {
        self.total = total
        self.pagination = pagination
        self.paging = paging
        self.matches = matches
    }
}
