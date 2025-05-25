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

/// - Remark: Generated from `#/components/schemas/Saved`.
public struct Saved: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Saved/state`.
    public var state: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Saved/isArchived`.
    public var isArchived: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Saved/dateCompleted`.
    public var dateCompleted: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Saved/dateDue`.
    public var dateDue: Swift.Int?
    /// Creates a new `Saved`.
    ///
    /// - Parameters:
    ///   - state:
    ///   - isArchived:
    ///   - dateCompleted:
    ///   - dateDue:
    public init(
        state: Swift.String? = nil,
        isArchived: Swift.Bool? = nil,
        dateCompleted: Swift.Int? = nil,
        dateDue: Swift.Int? = nil
    ) {
        self.state = state
        self.isArchived = isArchived
        self.dateCompleted = dateCompleted
        self.dateDue = dateDue
    }
}
