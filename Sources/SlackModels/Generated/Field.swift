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

/// - Remark: Generated from `#/components/schemas/Field`.
public struct Field: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Field/alt`.
    public var alt: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Field/value`.
    public var value: Swift.String?
    /// Creates a new `Field`.
    ///
    /// - Parameters:
    ///   - alt:
    ///   - value:
    public init(
        alt: Swift.String? = nil,
        value: Swift.String? = nil
    ) {
        self.alt = alt
        self.value = value
    }
}
