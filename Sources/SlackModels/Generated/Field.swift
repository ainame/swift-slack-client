@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/Field`.
public struct Field: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Field/value`.
    public var value: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Field/alt`.
    public var alt: Swift.String?
    /// Creates a new `Field`.
    ///
    /// - Parameters:
    ///   - value:
    ///   - alt:
    public init(
        value: Swift.String? = nil,
        alt: Swift.String? = nil
    ) {
        self.value = value
        self.alt = alt
    }
}
