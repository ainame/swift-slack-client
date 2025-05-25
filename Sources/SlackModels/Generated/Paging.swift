#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#endif
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit

/// - Remark: Generated from `#/components/schemas/Paging`.
public struct Paging: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Paging/count`.
    public var count: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Paging/total`.
    public var total: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Paging/page`.
    public var page: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Paging/pages`.
    public var pages: Swift.Int?
    /// Creates a new `Paging`.
    ///
    /// - Parameters:
    ///   - count:
    ///   - total:
    ///   - page:
    ///   - pages:
    public init(
        count: Swift.Int? = nil,
        total: Swift.Int? = nil,
        page: Swift.Int? = nil,
        pages: Swift.Int? = nil
    ) {
        self.count = count
        self.total = total
        self.page = page
        self.pages = pages
    }
}
