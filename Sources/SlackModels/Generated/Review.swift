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

/// - Remark: Generated from `#/components/schemas/Review`.
public struct Review: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Review/date_review`.
    public var dateReview: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Review/reviewing_team`.
    public var reviewingTeam: IngTeam?
    /// - Remark: Generated from `#/components/schemas/Review/type`.
    public var _type: Swift.String
    /// Creates a new `Review`.
    ///
    /// - Parameters:
    ///   - dateReview:
    ///   - reviewingTeam:
    ///   - _type:
    public init(
        dateReview: Swift.Int? = nil,
        reviewingTeam: IngTeam? = nil,
        _type: Swift.String,
    ) {
        self.dateReview = dateReview
        self.reviewingTeam = reviewingTeam
        self._type = _type
    }

    public enum CodingKeys: String, CodingKey {
        case dateReview = "date_review"
        case reviewingTeam = "reviewing_team"
        case _type = "type"
    }
}
