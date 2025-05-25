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

/// - Remark: Generated from `#/components/schemas/Acceptance`.
public struct Acceptance: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Acceptance/reviews`.
    public var reviews: [SlackModels.Review]?
    /// - Remark: Generated from `#/components/schemas/Acceptance/approvalStatus`.
    public var approvalStatus: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Acceptance/dateAccepted`.
    public var dateAccepted: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Acceptance/dateInvalid`.
    public var dateInvalid: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Acceptance/dateLastUpdated`.
    public var dateLastUpdated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Acceptance/acceptingTeam`.
    public var acceptingTeam: SlackModels.IngTeam?
    /// - Remark: Generated from `#/components/schemas/Acceptance/acceptingUser`.
    public var acceptingUser: SlackModels.TingUser?
    /// Creates a new `Acceptance`.
    ///
    /// - Parameters:
    ///   - reviews:
    ///   - approvalStatus:
    ///   - dateAccepted:
    ///   - dateInvalid:
    ///   - dateLastUpdated:
    ///   - acceptingTeam:
    ///   - acceptingUser:
    public init(
        reviews: [SlackModels.Review]? = nil,
        approvalStatus: Swift.String? = nil,
        dateAccepted: Swift.Int? = nil,
        dateInvalid: Swift.Int? = nil,
        dateLastUpdated: Swift.Int? = nil,
        acceptingTeam: SlackModels.IngTeam? = nil,
        acceptingUser: SlackModels.TingUser? = nil
    ) {
        self.reviews = reviews
        self.approvalStatus = approvalStatus
        self.dateAccepted = dateAccepted
        self.dateInvalid = dateInvalid
        self.dateLastUpdated = dateLastUpdated
        self.acceptingTeam = acceptingTeam
        self.acceptingUser = acceptingUser
    }
}
