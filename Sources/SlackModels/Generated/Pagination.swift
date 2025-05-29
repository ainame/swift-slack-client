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

/// - Remark: Generated from `#/components/schemas/Pagination`.
public struct Pagination: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Pagination/first`.
    public var first: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Pagination/last`.
    public var last: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Pagination/page`.
    public var page: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Pagination/page_count`.
    public var pageCount: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Pagination/per_page`.
    public var perPage: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Pagination/total_count`.
    public var totalCount: Swift.Int?
    /// Creates a new `Pagination`.
    ///
    /// - Parameters:
    ///   - first:
    ///   - last:
    ///   - page:
    ///   - pageCount:
    ///   - perPage:
    ///   - totalCount:
    public init(
        first: Swift.Int? = nil,
        last: Swift.Int? = nil,
        page: Swift.Int? = nil,
        pageCount: Swift.Int? = nil,
        perPage: Swift.Int? = nil,
        totalCount: Swift.Int? = nil
    ) {
        self.first = first
        self.last = last
        self.page = page
        self.pageCount = pageCount
        self.perPage = perPage
        self.totalCount = totalCount
    }

    public enum CodingKeys: String, CodingKey {
        case first
        case last
        case page
        case pageCount = "page_count"
        case perPage = "per_page"
        case totalCount = "total_count"
    }
}
