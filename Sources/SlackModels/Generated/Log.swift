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

/// - Remark: Generated from `#/components/schemas/Log`.
public struct Log: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Log/date`.
    public var date: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/scope`.
    public var scope: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/channel`.
    public var channel: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/reason`.
    public var reason: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/resolution`.
    public var resolution: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/userId`.
    public var userId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/userName`.
    public var userName: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/changeType`.
    public var changeType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/appType`.
    public var appType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/appId`.
    public var appId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/rssFeed`.
    public var rssFeed: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Log/rssFeedChangeType`.
    public var rssFeedChangeType: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/rssFeedTitle`.
    public var rssFeedTitle: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/rssFeedUrl`.
    public var rssFeedUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Log/serviceId`.
    public var serviceId: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Log/serviceType`.
    public var serviceType: Swift.String?
    /// Creates a new `Log`.
    ///
    /// - Parameters:
    ///   - date:
    ///   - scope:
    ///   - channel:
    ///   - reason:
    ///   - resolution:
    ///   - userId:
    ///   - userName:
    ///   - changeType:
    ///   - appType:
    ///   - appId:
    ///   - rssFeed:
    ///   - rssFeedChangeType:
    ///   - rssFeedTitle:
    ///   - rssFeedUrl:
    ///   - serviceId:
    ///   - serviceType:
    public init(
        date: Swift.String? = nil,
        scope: Swift.String? = nil,
        channel: Swift.String? = nil,
        reason: Swift.String? = nil,
        resolution: Swift.String? = nil,
        userId: Swift.String? = nil,
        userName: Swift.String? = nil,
        changeType: Swift.String? = nil,
        appType: Swift.String? = nil,
        appId: Swift.String? = nil,
        rssFeed: Swift.Bool? = nil,
        rssFeedChangeType: Swift.String? = nil,
        rssFeedTitle: Swift.String? = nil,
        rssFeedUrl: Swift.String? = nil,
        serviceId: Swift.Int? = nil,
        serviceType: Swift.String? = nil
    ) {
        self.date = date
        self.scope = scope
        self.channel = channel
        self.reason = reason
        self.resolution = resolution
        self.userId = userId
        self.userName = userName
        self.changeType = changeType
        self.appType = appType
        self.appId = appId
        self.rssFeed = rssFeed
        self.rssFeedChangeType = rssFeedChangeType
        self.rssFeedTitle = rssFeedTitle
        self.rssFeedUrl = rssFeedUrl
        self.serviceId = serviceId
        self.serviceType = serviceType
    }
}
