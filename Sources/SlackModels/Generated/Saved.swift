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

/// - Remark: Generated from `#/components/schemas/Saved`.
public struct Saved: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Saved/date_completed`.
    public var dateCompleted: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Saved/date_due`.
    public var dateDue: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Saved/is_archived`.
    public var isArchived: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Saved/state`.
    public var state: Swift.String?
    /// Creates a new `Saved`.
    ///
    /// - Parameters:
    ///   - dateCompleted:
    ///   - dateDue:
    ///   - isArchived:
    ///   - state:
    public init(
        dateCompleted: Swift.Int? = nil,
        dateDue: Swift.Int? = nil,
        isArchived: Swift.Bool? = nil,
        state: Swift.String? = nil
    ) {
        self.dateCompleted = dateCompleted
        self.dateDue = dateDue
        self.isArchived = isArchived
        self.state = state
    }

    public enum CodingKeys: String, CodingKey {
        case dateCompleted = "date_completed"
        case dateDue = "date_due"
        case isArchived = "is_archived"
        case state
    }
}
