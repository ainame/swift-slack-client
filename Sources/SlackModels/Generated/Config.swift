#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#endif
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit

/// - Remark: Generated from `#/components/schemas/Config`.
public struct Config: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Config/appId`.
    public var appId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Config/workflowAuthStrategy`.
    public var workflowAuthStrategy: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Config/domainRestrictions`.
    public var domainRestrictions: SlackModels.DomainRestrictions?
    /// Creates a new `Config`.
    ///
    /// - Parameters:
    ///   - appId:
    ///   - workflowAuthStrategy:
    ///   - domainRestrictions:
    public init(
        appId: Swift.String? = nil,
        workflowAuthStrategy: Swift.String? = nil,
        domainRestrictions: SlackModels.DomainRestrictions? = nil
    ) {
        self.appId = appId
        self.workflowAuthStrategy = workflowAuthStrategy
        self.domainRestrictions = domainRestrictions
    }
}
