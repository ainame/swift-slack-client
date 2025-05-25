@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/IncomingWebhook`.
public struct IncomingWebhook: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/IncomingWebhook/url`.
    public var url: Swift.String?
    /// - Remark: Generated from `#/components/schemas/IncomingWebhook/channel`.
    public var channel: Swift.String?
    /// - Remark: Generated from `#/components/schemas/IncomingWebhook/channelId`.
    public var channelId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/IncomingWebhook/configurationUrl`.
    public var configurationUrl: Swift.String?
    /// Creates a new `IncomingWebhook`.
    ///
    /// - Parameters:
    ///   - url:
    ///   - channel:
    ///   - channelId:
    ///   - configurationUrl:
    public init(
        url: Swift.String? = nil,
        channel: Swift.String? = nil,
        channelId: Swift.String? = nil,
        configurationUrl: Swift.String? = nil
    ) {
        self.url = url
        self.channel = channel
        self.channelId = channelId
        self.configurationUrl = configurationUrl
    }
}
