@_spi(Generated) import OpenAPIRuntime
#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif

/// - Remark: Generated from `#/components/schemas/Options`.
public struct Options: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Options/isScim`.
    public var isScim: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Options/isProtected`.
    public var isProtected: Swift.Bool?
    /// Creates a new `Options`.
    ///
    /// - Parameters:
    ///   - isScim:
    ///   - isProtected:
    public init(
        isScim: Swift.Bool? = nil,
        isProtected: Swift.Bool? = nil
    ) {
        self.isScim = isScim
        self.isProtected = isProtected
    }
}
