// Generated by swift-openapi-generator, do not modify.
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
/// Types generated from the components section of the OpenAPI document.

#if WebAPI_Auth
extension Components.Schemas {
    /// - Remark: Generated from `#/components/schemas/AuthRevokeResponse`.
    public struct AuthRevokeResponse: Codable, Hashable, Sendable {
        /// - Remark: Generated from `#/components/schemas/AuthRevokeResponse/ok`.
        public var ok: Swift.Bool
        /// - Remark: Generated from `#/components/schemas/AuthRevokeResponse/error`.
        public var error: Swift.String?
        /// - Remark: Generated from `#/components/schemas/AuthRevokeResponse/needed`.
        public var needed: Swift.String?
        /// - Remark: Generated from `#/components/schemas/AuthRevokeResponse/provided`.
        public var provided: Swift.String?
        /// Creates a new `AuthRevokeResponse`.
        ///
        /// - Parameters:
        ///   - ok:
        ///   - error:
        ///   - needed:
        ///   - provided:
        public init(
            ok: Swift.Bool,
            error: Swift.String? = nil,
            needed: Swift.String? = nil,
            provided: Swift.String? = nil
        ) {
            self.ok = ok
            self.error = error
            self.needed = needed
            self.provided = provided
        }
    }
    /// - Remark: Generated from `#/components/schemas/AuthTeamsListResponse`.
    public struct AuthTeamsListResponse: Codable, Hashable, Sendable {
        /// - Remark: Generated from `#/components/schemas/AuthTeamsListResponse/ok`.
        public var ok: Swift.Bool
        /// - Remark: Generated from `#/components/schemas/AuthTeamsListResponse/teams`.
        public var teams: [Components.Schemas.Team]?
        /// - Remark: Generated from `#/components/schemas/AuthTeamsListResponse/error`.
        public var error: Swift.String?
        /// - Remark: Generated from `#/components/schemas/AuthTeamsListResponse/needed`.
        public var needed: Swift.String?
        /// - Remark: Generated from `#/components/schemas/AuthTeamsListResponse/provided`.
        public var provided: Swift.String?
        /// - Remark: Generated from `#/components/schemas/AuthTeamsListResponse/responseMetadata`.
        public var responseMetadata: Components.Schemas.ResponseMetadata?
        /// Creates a new `AuthTeamsListResponse`.
        ///
        /// - Parameters:
        ///   - ok:
        ///   - teams:
        ///   - error:
        ///   - needed:
        ///   - provided:
        ///   - responseMetadata:
        public init(
            ok: Swift.Bool,
            teams: [Components.Schemas.Team]? = nil,
            error: Swift.String? = nil,
            needed: Swift.String? = nil,
            provided: Swift.String? = nil,
            responseMetadata: Components.Schemas.ResponseMetadata? = nil
        ) {
            self.ok = ok
            self.teams = teams
            self.error = error
            self.needed = needed
            self.provided = provided
            self.responseMetadata = responseMetadata
        }
    }
    /// - Remark: Generated from `#/components/schemas/AuthTestResponse`.
    public struct AuthTestResponse: Codable, Hashable, Sendable {
        /// - Remark: Generated from `#/components/schemas/AuthTestResponse/ok`.
        public var ok: Swift.Bool
        /// - Remark: Generated from `#/components/schemas/AuthTestResponse/url`.
        public var url: Swift.String?
        /// - Remark: Generated from `#/components/schemas/AuthTestResponse/team`.
        public var team: Swift.String?
        /// - Remark: Generated from `#/components/schemas/AuthTestResponse/user`.
        public var user: Swift.String?
        /// - Remark: Generated from `#/components/schemas/AuthTestResponse/error`.
        public var error: Swift.String?
        /// - Remark: Generated from `#/components/schemas/AuthTestResponse/needed`.
        public var needed: Swift.String?
        /// - Remark: Generated from `#/components/schemas/AuthTestResponse/provided`.
        public var provided: Swift.String?
        /// - Remark: Generated from `#/components/schemas/AuthTestResponse/teamId`.
        public var teamId: Swift.String?
        /// - Remark: Generated from `#/components/schemas/AuthTestResponse/userId`.
        public var userId: Swift.String?
        /// - Remark: Generated from `#/components/schemas/AuthTestResponse/botId`.
        public var botId: Swift.String?
        /// - Remark: Generated from `#/components/schemas/AuthTestResponse/isEnterpriseInstall`.
        public var isEnterpriseInstall: Swift.Bool?
        /// - Remark: Generated from `#/components/schemas/AuthTestResponse/appName`.
        public var appName: Swift.String?
        /// - Remark: Generated from `#/components/schemas/AuthTestResponse/appId`.
        public var appId: Swift.String?
        /// - Remark: Generated from `#/components/schemas/AuthTestResponse/enterpriseId`.
        public var enterpriseId: Swift.String?
        /// - Remark: Generated from `#/components/schemas/AuthTestResponse/expiresIn`.
        public var expiresIn: Swift.Int?
        /// Creates a new `AuthTestResponse`.
        ///
        /// - Parameters:
        ///   - ok:
        ///   - url:
        ///   - team:
        ///   - user:
        ///   - error:
        ///   - needed:
        ///   - provided:
        ///   - teamId:
        ///   - userId:
        ///   - botId:
        ///   - isEnterpriseInstall:
        ///   - appName:
        ///   - appId:
        ///   - enterpriseId:
        ///   - expiresIn:
        public init(
            ok: Swift.Bool,
            url: Swift.String? = nil,
            team: Swift.String? = nil,
            user: Swift.String? = nil,
            error: Swift.String? = nil,
            needed: Swift.String? = nil,
            provided: Swift.String? = nil,
            teamId: Swift.String? = nil,
            userId: Swift.String? = nil,
            botId: Swift.String? = nil,
            isEnterpriseInstall: Swift.Bool? = nil,
            appName: Swift.String? = nil,
            appId: Swift.String? = nil,
            enterpriseId: Swift.String? = nil,
            expiresIn: Swift.Int? = nil
        ) {
            self.ok = ok
            self.url = url
            self.team = team
            self.user = user
            self.error = error
            self.needed = needed
            self.provided = provided
            self.teamId = teamId
            self.userId = userId
            self.botId = botId
            self.isEnterpriseInstall = isEnterpriseInstall
            self.appName = appName
            self.appId = appId
            self.enterpriseId = enterpriseId
            self.expiresIn = expiresIn
        }
    }
}
#endif
