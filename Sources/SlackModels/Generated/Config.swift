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

/// - Remark: Generated from `#/components/schemas/Config`.
public struct Config: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Config/app_id`.
    public var appId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Config/domain_restrictions`.
    public var domainRestrictions: DomainRestrictions?
    /// - Remark: Generated from `#/components/schemas/Config/workflow_auth_strategy`.
    public var workflowAuthStrategy: Swift.String?
    /// Creates a new `Config`.
    ///
    /// - Parameters:
    ///   - appId:
    ///   - domainRestrictions:
    ///   - workflowAuthStrategy:
    public init(
        appId: Swift.String? = nil,
        domainRestrictions: DomainRestrictions? = nil,
        workflowAuthStrategy: Swift.String? = nil,
    ) {
        self.appId = appId
        self.domainRestrictions = domainRestrictions
        self.workflowAuthStrategy = workflowAuthStrategy
    }

    public enum CodingKeys: String, CodingKey {
        case appId = "app_id"
        case domainRestrictions = "domain_restrictions"
        case workflowAuthStrategy = "workflow_auth_strategy"
    }
}
