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

/// - Remark: Generated from `#/components/schemas/Review`.
public struct Review: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Review/type`.
    public var type: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Review/dateReview`.
    public var dateReview: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Review/reviewingTeam`.
    public var reviewingTeam: SlackModels.IngTeam?
    /// Creates a new `Review`.
    ///
    /// - Parameters:
    ///   - type:
    ///   - dateReview:
    ///   - reviewingTeam:
    public init(
        type: Swift.String? = nil,
        dateReview: Swift.Int? = nil,
        reviewingTeam: SlackModels.IngTeam? = nil
    ) {
        self.type = type
        self.dateReview = dateReview
        self.reviewingTeam = reviewingTeam
    }
}
