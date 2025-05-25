@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/DomainRestrictions`.
public struct DomainRestrictions: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/DomainRestrictions/emails`.
    public var emails: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/DomainRestrictions/urls`.
    public var urls: [Swift.String]?
    /// Creates a new `DomainRestrictions`.
    ///
    /// - Parameters:
    ///   - emails:
    ///   - urls:
    public init(
        emails: [Swift.String]? = nil,
        urls: [Swift.String]? = nil
    ) {
        self.emails = emails
        self.urls = urls
    }
}
