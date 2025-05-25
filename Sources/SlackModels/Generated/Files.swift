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

/// - Remark: Generated from `#/components/schemas/Files`.
public struct Files: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Files/total`.
    public var total: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Files/pagination`.
    public var pagination: SlackModels.Pagination?
    /// - Remark: Generated from `#/components/schemas/Files/paging`.
    public var paging: SlackModels.Paging?
    /// - Remark: Generated from `#/components/schemas/Files/matches`.
    public var matches: [SlackModels.Match]?
    /// Creates a new `Files`.
    ///
    /// - Parameters:
    ///   - total:
    ///   - pagination:
    ///   - paging:
    ///   - matches:
    public init(
        total: Swift.Int? = nil,
        pagination: SlackModels.Pagination? = nil,
        paging: SlackModels.Paging? = nil,
        matches: [SlackModels.Match]? = nil
    ) {
        self.total = total
        self.pagination = pagination
        self.paging = paging
        self.matches = matches
    }
}
