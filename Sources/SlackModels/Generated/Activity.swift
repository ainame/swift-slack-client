@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/Activity`.
public struct Activity: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Activity/level`.
    public var level: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Activity/source`.
    public var source: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Activity/payload`.
    public var payload: Payload?
    /// - Remark: Generated from `#/components/schemas/Activity/created`.
    public var created: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Activity/appId`.
    public var appId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Activity/eventType`.
    public var eventType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Activity/componentType`.
    public var componentType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Activity/componentId`.
    public var componentId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Activity/teamId`.
    public var teamId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Activity/enterpriseId`.
    public var enterpriseId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Activity/traceId`.
    public var traceId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Activity/parentExecutionId`.
    public var parentExecutionId: Swift.String?
    /// Creates a new `Activity`.
    ///
    /// - Parameters:
    ///   - level:
    ///   - source:
    ///   - payload:
    ///   - created:
    ///   - appId:
    ///   - eventType:
    ///   - componentType:
    ///   - componentId:
    ///   - teamId:
    ///   - enterpriseId:
    ///   - traceId:
    ///   - parentExecutionId:
    public init(
        level: Swift.String? = nil,
        source: Swift.String? = nil,
        payload: Payload? = nil,
        created: Swift.Int? = nil,
        appId: Swift.String? = nil,
        eventType: Swift.String? = nil,
        componentType: Swift.String? = nil,
        componentId: Swift.String? = nil,
        teamId: Swift.String? = nil,
        enterpriseId: Swift.String? = nil,
        traceId: Swift.String? = nil,
        parentExecutionId: Swift.String? = nil
    ) {
        self.level = level
        self.source = source
        self.payload = payload
        self.created = created
        self.appId = appId
        self.eventType = eventType
        self.componentType = componentType
        self.componentId = componentId
        self.teamId = teamId
        self.enterpriseId = enterpriseId
        self.traceId = traceId
        self.parentExecutionId = parentExecutionId
    }
}
