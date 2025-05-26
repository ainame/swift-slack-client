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

/// - Remark: Generated from `#/components/schemas/Purpose`.
public struct Purpose: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Purpose/creator`.
    public var creator: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Purpose/last_set`.
    public var lastSet: Swift.Int?
    /// - Remark: Generated from `#/components/schemas/Purpose/value`.
    public var value: Swift.String?
    /// Creates a new `Purpose`.
    ///
    /// - Parameters:
    ///   - creator:
    ///   - lastSet:
    ///   - value:
    public init(
        creator: Swift.String? = nil,
        lastSet: Swift.Int? = nil,
        value: Swift.String? = nil
    ) {
        self.creator = creator
        self.lastSet = lastSet
        self.value = value
    }
}
