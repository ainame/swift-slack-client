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
    /// - Remark: Generated from `#/components/schemas/Acceptance/reviews`.
    public var reviews: [Review]?
    /// - Remark: Generated from `#/components/schemas/Acceptance/approvalStatus`.
    public var approvalStatus: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Acceptance/dateAccepted`.
    public var dateAccepted: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Acceptance/dateInvalid`.
    public var dateInvalid: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Acceptance/dateLastUpdated`.
    public var dateLastUpdated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Acceptance/acceptingTeam`.
    public var acceptingTeam: IngTeam?
    /// - Remark: Generated from `#/components/schemas/Acceptance/acceptingUser`.
    public var acceptingUser: TingUser?
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
        reviews: [Review]? = nil,
        approvalStatus: Swift.String? = nil,
        dateAccepted: Swift.Int? = nil,
        dateInvalid: Swift.Int? = nil,
        dateLastUpdated: Swift.Int? = nil,
        acceptingTeam: IngTeam? = nil,
        acceptingUser: TingUser? = nil
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
