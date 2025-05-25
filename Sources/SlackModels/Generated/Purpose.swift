@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/Purpose`.
public struct Purpose: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Purpose/value`.
    public var value: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Purpose/creator`.
    public var creator: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Purpose/lastSet`.
    public var lastSet: Swift.Int?
    /// Creates a new `Purpose`.
    ///
    /// - Parameters:
    ///   - value:
    ///   - creator:
    ///   - lastSet:
    public init(
        value: Swift.String? = nil,
        creator: Swift.String? = nil,
        lastSet: Swift.Int? = nil
    ) {
        self.value = value
        self.creator = creator
        self.lastSet = lastSet
    }
}
