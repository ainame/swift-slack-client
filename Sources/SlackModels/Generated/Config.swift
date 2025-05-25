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

/// - Remark: Generated from `#/components/schemas/Config`.
public struct Config: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Config/appId`.
    public var appId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Config/workflowAuthStrategy`.
    public var workflowAuthStrategy: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Config/domainRestrictions`.
    public var domainRestrictions: DomainRestrictions?
    /// Creates a new `Config`.
    ///
    /// - Parameters:
    ///   - appId:
    ///   - workflowAuthStrategy:
    ///   - domainRestrictions:
    public init(
        appId: Swift.String? = nil,
        workflowAuthStrategy: Swift.String? = nil,
        domainRestrictions: DomainRestrictions? = nil
    ) {
        self.appId = appId
        self.workflowAuthStrategy = workflowAuthStrategy
        self.domainRestrictions = domainRestrictions
    }
}
