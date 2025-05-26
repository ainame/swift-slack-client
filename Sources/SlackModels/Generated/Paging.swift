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

/// - Remark: Generated from `#/components/schemas/Paging`.
public struct Paging: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Paging/count`.
    public var count: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Paging/page`.
    public var page: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Paging/pages`.
    public var pages: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Paging/total`.
    public var total: Swift.Int?
    /// Creates a new `Paging`.
    ///
    /// - Parameters:
    ///   - count:
    ///   - page:
    ///   - pages:
    ///   - total:
    public init(
        count: Swift.Int? = nil,
        page: Swift.Int? = nil,
        pages: Swift.Int? = nil,
        total: Swift.Int? = nil
    ) {
        self.count = count
        self.page = page
        self.pages = pages
        self.total = total
    }
    public enum CodingKeys: String, CodingKey {
        case count
        case page
        case pages
        case total
    }
}
