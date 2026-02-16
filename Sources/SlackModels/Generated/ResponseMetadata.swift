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

/// - Remark: Generated from `#/components/schemas/ResponseMetadata`.
public struct ResponseMetadata: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/ResponseMetadata/messages`.
    public var messages: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/ResponseMetadata/warnings`.
    public var warnings: [OpenAPIRuntime.OpenAPIValueContainer]?
    /// Creates a new `ResponseMetadata`.
    ///
    /// - Parameters:
    ///   - messages:
    ///   - warnings:
    public init(
        messages: [Swift.String]? = nil,
        warnings: [OpenAPIRuntime.OpenAPIValueContainer]? = nil,
    ) {
        self.messages = messages
        self.warnings = warnings
    }

    public enum CodingKeys: String, CodingKey {
        case messages
        case warnings
    }
}
