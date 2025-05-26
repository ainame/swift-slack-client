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

/// - Remark: Generated from `#/components/schemas/Review`.
public struct Review: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Review/date_review`.
    public var dateReview: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Review/reviewing_team`.
    public var reviewingTeam: IngTeam?
    /// - Remark: Generated from `#/components/schemas/Review/type`.
    public var type: Swift.String?
    /// Creates a new `Review`.
    ///
    /// - Parameters:
    ///   - dateReview:
    ///   - reviewingTeam:
    ///   - type:
    public init(
        dateReview: Swift.Int? = nil,
        reviewingTeam: IngTeam? = nil,
        type: Swift.String? = nil
    ) {
        self.dateReview = dateReview
        self.reviewingTeam = reviewingTeam
        self.type = type
    }
}
