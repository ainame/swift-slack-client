#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit
#endif
#endif

/// - Remark: Generated from `#/components/schemas/Interactivity`.
public struct Interactivity: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Interactivity/isEnabled`.
    public var isEnabled: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Interactivity/requestUrl`.
    public var requestUrl: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Interactivity/messageMenuOptionsUrl`.
    public var messageMenuOptionsUrl: Swift.String?
    /// Creates a new `Interactivity`.
    ///
    /// - Parameters:
    ///   - isEnabled:
    ///   - requestUrl:
    ///   - messageMenuOptionsUrl:
    public init(
        isEnabled: Swift.Bool? = nil,
        requestUrl: Swift.String? = nil,
        messageMenuOptionsUrl: Swift.String? = nil
    ) {
        self.isEnabled = isEnabled
        self.requestUrl = requestUrl
        self.messageMenuOptionsUrl = messageMenuOptionsUrl
    }
}
