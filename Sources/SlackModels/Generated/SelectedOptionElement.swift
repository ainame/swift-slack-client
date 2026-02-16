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

/// - Remark: Generated from `#/components/schemas/SelectedOptionElement`.
public struct SelectedOptionElement: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/SelectedOptionElement/text`.
    public var text: Swift.String?
    /// - Remark: Generated from `#/components/schemas/SelectedOptionElement/value`.
    public var value: Swift.String?
    /// Creates a new `SelectedOptionElement`.
    ///
    /// - Parameters:
    ///   - text:
    ///   - value:
    public init(
        text: Swift.String? = nil,
        value: Swift.String? = nil
    ) {
        self.text = text
        self.value = value
    }
    public enum CodingKeys: String, CodingKey {
        case text
        case value
    }
}
