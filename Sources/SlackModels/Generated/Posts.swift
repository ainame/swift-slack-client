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

/// - Remark: Generated from `#/components/schemas/Posts`.
public struct Posts: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Posts/total`.
    public var total: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Posts/matches`.
    public var matches: [Swift.String]?
    /// Creates a new `Posts`.
    ///
    /// - Parameters:
    ///   - total:
    ///   - matches:
    public init(
        total: Swift.Int? = nil,
        matches: [Swift.String]? = nil
    ) {
        self.total = total
        self.matches = matches
    }
}
