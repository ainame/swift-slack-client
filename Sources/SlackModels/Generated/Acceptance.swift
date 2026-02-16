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

/// - Remark: Generated from `#/components/schemas/Acceptance`.
public struct Acceptance: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Acceptance/accepting_team`.
    public var acceptingTeam: IngTeam?
    /// - Remark: Generated from `#/components/schemas/Acceptance/accepting_user`.
    public var acceptingUser: TingUser?
    /// - Remark: Generated from `#/components/schemas/Acceptance/approval_status`.
    public var approvalStatus: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Acceptance/date_accepted`.
    public var dateAccepted: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Acceptance/date_invalid`.
    public var dateInvalid: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Acceptance/date_last_updated`.
    public var dateLastUpdated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Acceptance/reviews`.
    public var reviews: [Review]?
    /// Creates a new `Acceptance`.
    ///
    /// - Parameters:
    ///   - acceptingTeam:
    ///   - acceptingUser:
    ///   - approvalStatus:
    ///   - dateAccepted:
    ///   - dateInvalid:
    ///   - dateLastUpdated:
    ///   - reviews:
    public init(
        acceptingTeam: IngTeam? = nil,
        acceptingUser: TingUser? = nil,
        approvalStatus: Swift.String? = nil,
        dateAccepted: Swift.Int? = nil,
        dateInvalid: Swift.Int? = nil,
        dateLastUpdated: Swift.Int? = nil,
        reviews: [Review]? = nil
    ) {
        self.acceptingTeam = acceptingTeam
        self.acceptingUser = acceptingUser
        self.approvalStatus = approvalStatus
        self.dateAccepted = dateAccepted
        self.dateInvalid = dateInvalid
        self.dateLastUpdated = dateLastUpdated
        self.reviews = reviews
    }
    public enum CodingKeys: String, CodingKey {
        case acceptingTeam = "accepting_team"
        case acceptingUser = "accepting_user"
        case approvalStatus = "approval_status"
        case dateAccepted = "date_accepted"
        case dateInvalid = "date_invalid"
        case dateLastUpdated = "date_last_updated"
        case reviews
    }
}
