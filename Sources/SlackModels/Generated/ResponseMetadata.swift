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

/// - Remark: Generated from `#/components/schemas/ResponseMetadata`.
public struct ResponseMetadata: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ResponseMetadata/messages`.
    public var messages: [Swift.String]?
    /// Creates a new `ResponseMetadata`.
    ///
    /// - Parameters:
    ///   - messages:
    public init(messages: [Swift.String]? = nil) {
        self.messages = messages
    }
}
