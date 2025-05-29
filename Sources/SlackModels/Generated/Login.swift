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

/// - Remark: Generated from `#/components/schemas/Login`.
public struct Login: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Login/count`.
    public var count: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Login/country`.
    public var country: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Login/date_first`.
    public var dateFirst: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Login/date_last`.
    public var dateLast: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Login/ip`.
    public var ip: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Login/isp`.
    public var isp: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Login/region`.
    public var region: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Login/user_agent`.
    public var userAgent: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Login/user_id`.
    public var userId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Login/username`.
    public var username: Swift.String?
    /// Creates a new `Login`.
    ///
    /// - Parameters:
    ///   - count:
    ///   - country:
    ///   - dateFirst:
    ///   - dateLast:
    ///   - ip:
    ///   - isp:
    ///   - region:
    ///   - userAgent:
    ///   - userId:
    ///   - username:
    public init(
        count: Swift.Int? = nil,
        country: Swift.String? = nil,
        dateFirst: Swift.Int? = nil,
        dateLast: Swift.Int? = nil,
        ip: Swift.String? = nil,
        isp: Swift.String? = nil,
        region: Swift.String? = nil,
        userAgent: Swift.String? = nil,
        userId: Swift.String? = nil,
        username: Swift.String? = nil
    ) {
        self.count = count
        self.country = country
        self.dateFirst = dateFirst
        self.dateLast = dateLast
        self.ip = ip
        self.isp = isp
        self.region = region
        self.userAgent = userAgent
        self.userId = userId
        self.username = username
    }

    public enum CodingKeys: String, CodingKey {
        case count
        case country
        case dateFirst = "date_first"
        case dateLast = "date_last"
        case ip
        case isp
        case region
        case userAgent = "user_agent"
        case userId = "user_id"
        case username
    }
}
