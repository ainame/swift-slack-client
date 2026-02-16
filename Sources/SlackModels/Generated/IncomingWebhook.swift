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

/// - Remark: Generated from `#/components/schemas/IncomingWebhook`.
public struct IncomingWebhook: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/IncomingWebhook/channel`.
    public var channel: Swift.String?
    /// - Remark: Generated from `#/components/schemas/IncomingWebhook/channel_id`.
    public var channelId: Swift.String?
    /// - Remark: Generated from `#/components/schemas/IncomingWebhook/configuration_url`.
    public var configurationUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/IncomingWebhook/url`.
    public var url: Swift.String?
    /// Creates a new `IncomingWebhook`.
    ///
    /// - Parameters:
    ///   - channel:
    ///   - channelId:
    ///   - configurationUrl:
    ///   - url:
    public init(
        channel: Swift.String? = nil,
        channelId: Swift.String? = nil,
        configurationUrl: Swift.String? = nil,
        url: Swift.String? = nil
    ) {
        self.channel = channel
        self.channelId = channelId
        self.configurationUrl = configurationUrl
        self.url = url
    }
    public enum CodingKeys: String, CodingKey {
        case channel
        case channelId = "channel_id"
        case configurationUrl = "configuration_url"
        case url
    }
}
