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

/// - Remark: Generated from `#/components/schemas/Activity`.
public struct Activity: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Activity/app_id`.
    public var appId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Activity/component_id`.
    public var componentId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Activity/component_type`.
    public var componentType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Activity/created`.
    public var created: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Activity/enterprise_id`.
    public var enterpriseId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Activity/event_type`.
    public var eventType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Activity/level`.
    public var level: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Activity/parent_execution_id`.
    public var parentExecutionId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Activity/payload`.
    public var payload: Payload?
    /// - Remark: Generated from `#/components/schemas/Activity/source`.
    public var source: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Activity/team_id`.
    public var teamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Activity/trace_id`.
    public var traceId: Swift.String?
    /// Creates a new `Activity`.
    ///
    /// - Parameters:
    ///   - appId:
    ///   - componentId:
    ///   - componentType:
    ///   - created:
    ///   - enterpriseId:
    ///   - eventType:
    ///   - level:
    ///   - parentExecutionId:
    ///   - payload:
    ///   - source:
    ///   - teamId:
    ///   - traceId:
    public init(
        appId: Swift.String? = nil,
        componentId: Swift.String? = nil,
        componentType: Swift.String? = nil,
        created: Swift.Int? = nil,
        enterpriseId: Swift.String? = nil,
        eventType: Swift.String? = nil,
        level: Swift.String? = nil,
        parentExecutionId: Swift.String? = nil,
        payload: Payload? = nil,
        source: Swift.String? = nil,
        teamId: Swift.String? = nil,
        traceId: Swift.String? = nil
    ) {
        self.appId = appId
        self.componentId = componentId
        self.componentType = componentType
        self.created = created
        self.enterpriseId = enterpriseId
        self.eventType = eventType
        self.level = level
        self.parentExecutionId = parentExecutionId
        self.payload = payload
        self.source = source
        self.teamId = teamId
        self.traceId = traceId
    }

    public enum CodingKeys: String, CodingKey {
        case appId = "app_id"
        case componentId = "component_id"
        case componentType = "component_type"
        case created
        case enterpriseId = "enterprise_id"
        case eventType = "event_type"
        case level
        case parentExecutionId = "parent_execution_id"
        case payload
        case source
        case teamId = "team_id"
        case traceId = "trace_id"
    }
}
