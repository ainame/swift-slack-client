@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/Login`.
public struct Login: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Login/username`.
    public var username: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Login/count`.
    public var count: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Login/ip`.
    public var ip: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Login/isp`.
    public var isp: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Login/country`.
    public var country: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Login/region`.
    public var region: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Login/userId`.
    public var userId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Login/dateFirst`.
    public var dateFirst: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Login/dateLast`.
    public var dateLast: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Login/userAgent`.
    public var userAgent: Swift.String?
    /// Creates a new `Login`.
    ///
    /// - Parameters:
    ///   - username:
    ///   - count:
    ///   - ip:
    ///   - isp:
    ///   - country:
    ///   - region:
    ///   - userId:
    ///   - dateFirst:
    ///   - dateLast:
    ///   - userAgent:
    public init(
        username: Swift.String? = nil,
        count: Swift.Int? = nil,
        ip: Swift.String? = nil,
        isp: Swift.String? = nil,
        country: Swift.String? = nil,
        region: Swift.String? = nil,
        userId: Swift.String? = nil,
        dateFirst: Swift.Int? = nil,
        dateLast: Swift.Int? = nil,
        userAgent: Swift.String? = nil
    ) {
        self.username = username
        self.count = count
        self.ip = ip
        self.isp = isp
        self.country = country
        self.region = region
        self.userId = userId
        self.dateFirst = dateFirst
        self.dateLast = dateLast
        self.userAgent = userAgent
    }
}
