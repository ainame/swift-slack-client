@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/Cc`.
public struct Cc: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Cc/address`.
    public var address: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Cc/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Cc/original`.
    public var original: Swift.String?
    /// Creates a new `Cc`.
    ///
    /// - Parameters:
    ///   - address:
    ///   - name:
    ///   - original:
    public init(
        address: Swift.String? = nil,
        name: Swift.String? = nil,
        original: Swift.String? = nil
    ) {
        self.address = address
        self.name = name
        self.original = original
    }
}
