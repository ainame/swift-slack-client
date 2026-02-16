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

/// - Remark: Generated from `#/components/schemas/Choice`.
public struct Choice: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Choice/color`.
    public var color: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Choice/label`.
    public var label: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Choice/value`.
    public var value: Swift.String?
    /// Creates a new `Choice`.
    ///
    /// - Parameters:
    ///   - color:
    ///   - label:
    ///   - value:
    public init(
        color: Swift.String? = nil,
        label: Swift.String? = nil,
        value: Swift.String? = nil
    ) {
        self.color = color
        self.label = label
        self.value = value
    }
    public enum CodingKeys: String, CodingKey {
        case color
        case label
        case value
    }
}
