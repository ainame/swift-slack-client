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

/// - Remark: Generated from `#/components/schemas/Pagination`.
public struct Pagination: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Pagination/page`.
    public var page: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Pagination/first`.
    public var first: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Pagination/last`.
    public var last: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Pagination/totalCount`.
    public var totalCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Pagination/perPage`.
    public var perPage: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Pagination/pageCount`.
    public var pageCount: Swift.Int?
    /// Creates a new `Pagination`.
    ///
    /// - Parameters:
    ///   - page:
    ///   - first:
    ///   - last:
    ///   - totalCount:
    ///   - perPage:
    ///   - pageCount:
    public init(
        page: Swift.Int? = nil,
        first: Swift.Int? = nil,
        last: Swift.Int? = nil,
        totalCount: Swift.Int? = nil,
        perPage: Swift.Int? = nil,
        pageCount: Swift.Int? = nil
    ) {
        self.page = page
        self.first = first
        self.last = last
        self.totalCount = totalCount
        self.perPage = perPage
        self.pageCount = pageCount
    }
}
