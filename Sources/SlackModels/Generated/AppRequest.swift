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

/// - Remark: Generated from `#/components/schemas/AppRequest`.
public struct AppRequest: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/AppRequest/app`.
    public var app: App?
    /// - Remark: Generated from `#/components/schemas/AppRequest/date_created`.
    public var dateCreated: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/AppRequest/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AppRequest/is_user_app_collaborator`.
    public var isUserAppCollaborator: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/AppRequest/message`.
    public var message: Message?
    /// - Remark: Generated from `#/components/schemas/AppRequest/previous_resolution`.
    public var previousResolution: PreviousResolution?
    /// - Remark: Generated from `#/components/schemas/AppRequest/scopes`.
    public var scopes: [OpenAPIRuntime.OpenAPIValueContainer]?
    /// - Remark: Generated from `#/components/schemas/AppRequest/team`.
    public var team: Team?
    /// - Remark: Generated from `#/components/schemas/AppRequest/user`.
    public var user: User?
    /// Creates a new `AppRequest`.
    ///
    /// - Parameters:
    ///   - app:
    ///   - dateCreated:
    ///   - id:
    ///   - isUserAppCollaborator:
    ///   - message:
    ///   - previousResolution:
    ///   - scopes:
    ///   - team:
    ///   - user:
    public init(
        app: App? = nil,
        dateCreated: Swift.Int? = nil,
        id: Swift.String? = nil,
        isUserAppCollaborator: Swift.Bool? = nil,
        message: Message? = nil,
        previousResolution: PreviousResolution? = nil,
        scopes: [OpenAPIRuntime.OpenAPIValueContainer]? = nil,
        team: Team? = nil,
        user: User? = nil
    ) {
        self.app = app
        self.dateCreated = dateCreated
        self.id = id
        self.isUserAppCollaborator = isUserAppCollaborator
        self.message = message
        self.previousResolution = previousResolution
        self.scopes = scopes
        self.team = team
        self.user = user
    }

    public enum CodingKeys: String, CodingKey {
        case app
        case dateCreated = "date_created"
        case id
        case isUserAppCollaborator = "is_user_app_collaborator"
        case message
        case previousResolution = "previous_resolution"
        case scopes
        case team
        case user
    }
}
