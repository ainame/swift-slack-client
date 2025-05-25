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

/// - Remark: Generated from `#/components/schemas/Files`.
public struct Files: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Files/total`.
    public var total: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Files/pagination`.
    public var pagination: Pagination?
    /// - Remark: Generated from `#/components/schemas/Files/paging`.
    public var paging: Paging?
    /// - Remark: Generated from `#/components/schemas/Files/matches`.
    public var matches: [Match]?
    /// Creates a new `Files`.
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
