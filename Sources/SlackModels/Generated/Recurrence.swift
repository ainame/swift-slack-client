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

/// - Remark: Generated from `#/components/schemas/Recurrence`.
public struct Recurrence: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Recurrence/frequency`.
    public var frequency: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Recurrence/weekdays`.
    public var weekdays: [Swift.String]?
    /// Creates a new `Recurrence`.
    ///
    /// - Parameters:
    ///   - frequency:
    ///   - weekdays:
    public init(
        frequency: Swift.String? = nil,
        weekdays: [Swift.String]? = nil,
    ) {
        self.frequency = frequency
        self.weekdays = weekdays
    }

    public enum CodingKeys: String, CodingKey {
        case frequency
        case weekdays
    }
}
