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

/// - Remark: Generated from `#/components/schemas/Log`.
public struct Log: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Log/app_id`.
    public var appId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/app_type`.
    public var appType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/change_type`.
    public var changeType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/channel`.
    public var channel: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/date`.
    public var date: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/reason`.
    public var reason: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/resolution`.
    public var resolution: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/rss_feed`.
    public var rssFeed: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Log/rss_feed_change_type`.
    public var rssFeedChangeType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/rss_feed_title`.
    public var rssFeedTitle: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/rss_feed_url`.
    public var rssFeedUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/scope`.
    public var scope: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/service_id`.
    public var serviceId: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Log/service_type`.
    public var serviceType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/user_id`.
    public var userId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/user_name`.
    public var userName: Swift.String?
    /// Creates a new `Log`.
    ///
    /// - Parameters:
    ///   - appId:
    ///   - appType:
    ///   - changeType:
    ///   - channel:
    ///   - date:
    ///   - reason:
    ///   - resolution:
    ///   - rssFeed:
    ///   - rssFeedChangeType:
    ///   - rssFeedTitle:
    ///   - rssFeedUrl:
    ///   - scope:
    ///   - serviceId:
    ///   - serviceType:
    ///   - userId:
    ///   - userName:
    public init(
        appId: Swift.String? = nil,
        appType: Swift.String? = nil,
        changeType: Swift.String? = nil,
        channel: Swift.String? = nil,
        date: Swift.String? = nil,
        reason: Swift.String? = nil,
        resolution: Swift.String? = nil,
        rssFeed: Swift.Bool? = nil,
        rssFeedChangeType: Swift.String? = nil,
        rssFeedTitle: Swift.String? = nil,
        rssFeedUrl: Swift.String? = nil,
        scope: Swift.String? = nil,
        serviceId: Swift.Int? = nil,
        serviceType: Swift.String? = nil,
        userId: Swift.String? = nil,
        userName: Swift.String? = nil
    ) {
        self.appId = appId
        self.appType = appType
        self.changeType = changeType
        self.channel = channel
        self.date = date
        self.reason = reason
        self.resolution = resolution
        self.rssFeed = rssFeed
        self.rssFeedChangeType = rssFeedChangeType
        self.rssFeedTitle = rssFeedTitle
        self.rssFeedUrl = rssFeedUrl
        self.scope = scope
        self.serviceId = serviceId
        self.serviceType = serviceType
        self.userId = userId
        self.userName = userName
    }
}
