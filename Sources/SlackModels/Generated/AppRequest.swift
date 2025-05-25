@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/AppRequest`.
public struct AppRequest: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/AppRequest/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/AppRequest/app`.
    public var app: App?
    /// - Remark: Generated from `#/components/schemas/AppRequest/user`.
    public var user: User?
    /// - Remark: Generated from `#/components/schemas/AppRequest/team`.
    public var team: Team?
    /// - Remark: Generated from `#/components/schemas/AppRequest/scopes`.
    public var scopes: [OpenAPIRuntime.OpenAPIValueContainer]?
    /// - Remark: Generated from `#/components/schemas/AppRequest/message`.
    public var message: Message?
    /// - Remark: Generated from `#/components/schemas/AppRequest/previousResolution`.
    public var previousResolution: PreviousResolution?
    /// - Remark: Generated from `#/components/schemas/AppRequest/isUserAppCollaborator`.
    public var isUserAppCollaborator: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/AppRequest/dateCreated`.
    public var dateCreated: Swift.Int?
    /// Creates a new `AppRequest`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - app:
    ///   - user:
    ///   - team:
    ///   - scopes:
    ///   - message:
    ///   - previousResolution:
    ///   - isUserAppCollaborator:
    ///   - dateCreated:
    public init(
        id: Swift.String? = nil,
        app: App? = nil,
        user: User? = nil,
        team: Team? = nil,
        scopes: [OpenAPIRuntime.OpenAPIValueContainer]? = nil,
        message: Message? = nil,
        previousResolution: PreviousResolution? = nil,
        isUserAppCollaborator: Swift.Bool? = nil,
        dateCreated: Swift.Int? = nil
    ) {
        self.id = id
        self.app = app
        self.user = user
        self.team = team
        self.scopes = scopes
        self.message = message
        self.previousResolution = previousResolution
        self.isUserAppCollaborator = isUserAppCollaborator
        self.dateCreated = dateCreated
    }
}
