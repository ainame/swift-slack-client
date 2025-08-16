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

/// - Remark: Generated from `#/components/schemas/Interactivity`.
public struct Interactivity: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Interactivity/is_enabled`.
    public var isEnabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Interactivity/message_menu_options_url`.
    public var messageMenuOptionsUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Interactivity/request_url`.
    public var requestUrl: Swift.String?
    /// Creates a new `Interactivity`.
    ///
    /// - Parameters:
    ///   - isEnabled:
    ///   - messageMenuOptionsUrl:
    ///   - requestUrl:
    public init(
        isEnabled: Swift.Bool? = nil,
        messageMenuOptionsUrl: Swift.String? = nil,
        requestUrl: Swift.String? = nil,
    ) {
        self.isEnabled = isEnabled
        self.messageMenuOptionsUrl = messageMenuOptionsUrl
        self.requestUrl = requestUrl
    }

    public enum CodingKeys: String, CodingKey {
        case isEnabled = "is_enabled"
        case messageMenuOptionsUrl = "message_menu_options_url"
        case requestUrl = "request_url"
    }
}
