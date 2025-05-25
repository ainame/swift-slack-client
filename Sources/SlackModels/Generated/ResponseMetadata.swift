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
