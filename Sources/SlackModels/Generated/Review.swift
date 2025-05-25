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
    /// - Remark: Generated from `#/components/schemas/Review/type`.
    public var type: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Review/dateReview`.
    public var dateReview: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Review/reviewingTeam`.
    public var reviewingTeam: IngTeam?
    /// Creates a new `Review`.
    ///
    /// - Parameters:
    ///   - type:
    ///   - dateReview:
    ///   - reviewingTeam:
    public init(
        type: Swift.String? = nil,
        dateReview: Swift.Int? = nil,
        reviewingTeam: IngTeam? = nil
    ) {
        self.type = type
        self.dateReview = dateReview
        self.reviewingTeam = reviewingTeam
    }
}
