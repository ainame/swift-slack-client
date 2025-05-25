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
        weekdays: [Swift.String]? = nil
    ) {
        self.frequency = frequency
        self.weekdays = weekdays
    }
}
