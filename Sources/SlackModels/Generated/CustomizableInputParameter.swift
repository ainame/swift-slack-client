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

/// - Remark: Generated from `#/components/schemas/CustomizableInputParameter`.
public struct CustomizableInputParameter: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/CustomizableInputParameter/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/CustomizableInputParameter/value`.
    public var value: Swift.String?
    /// Creates a new `CustomizableInputParameter`.
    ///
    /// - Parameters:
    ///   - name:
    ///   - value:
    public init(
        name: Swift.String? = nil,
        value: Swift.String? = nil
    ) {
        self.name = name
        self.value = value
    }

    public enum CodingKeys: String, CodingKey {
        case name
        case value
    }
}
