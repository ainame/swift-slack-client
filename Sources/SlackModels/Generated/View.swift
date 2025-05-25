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

/// - Remark: Generated from `#/components/schemas/View`.
public struct View: Codable, Hashable, Sendable {
    /// A container of undocumented properties.
    public var additionalProperties: OpenAPIRuntime.OpenAPIObjectContainer
    /// Creates a new `View`.
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
