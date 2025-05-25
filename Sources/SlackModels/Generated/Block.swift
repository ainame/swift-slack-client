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

/// - Remark: Generated from `#/components/schemas/Block`.
public struct Block: Codable, Hashable, Sendable {
    /// A container of undocumented properties.
    public var additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer
    /// Creates a new `Block`.
    ///
    /// - Parameters:
    ///   - additionalProperties: A container of undocumented properties.
    public init(additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer = .init()) {
        self.additionalProperties = additionalProperties
    }
    public init(from decoder: any Decoder) throws {
        additionalProperties = try decoder.decodeAdditionalProperties(knownKeys: [])
    }
    public func encode(to encoder: any Encoder) throws {
        try encoder.encodeAdditionalProperties(additionalProperties)
    }
}
