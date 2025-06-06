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

/// - Remark: Generated from `#/components/schemas/ActiveSession`.
public struct ActiveSession: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ActiveSession/created`.
    public var created: Created?
    /// - Remark: Generated from `#/components/schemas/ActiveSession/recent`.
    public var recent: Created?
    /// - Remark: Generated from `#/components/schemas/ActiveSession/session_id`.
    public var sessionId: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/ActiveSession/team_id`.
    public var teamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/ActiveSession/user_id`.
    public var userId: Swift.String?
    /// Creates a new `ActiveSession`.
    ///
    /// - Parameters:
    ///   - created:
    ///   - recent:
    ///   - sessionId:
    ///   - teamId:
    ///   - userId:
    public init(
        created: Created? = nil,
        recent: Created? = nil,
        sessionId: Swift.Int? = nil,
        teamId: Swift.String? = nil,
        userId: Swift.String? = nil
    ) {
        self.created = created
        self.recent = recent
        self.sessionId = sessionId
        self.teamId = teamId
        self.userId = userId
    }

    public enum CodingKeys: String, CodingKey {
        case created
        case recent
        case sessionId = "session_id"
        case teamId = "team_id"
        case userId = "user_id"
    }
}
