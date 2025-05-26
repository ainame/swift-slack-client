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

/// - Remark: Generated from `#/components/schemas/Options`.
public struct Options: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Options/is_protected`.
    public var isProtected: Swift.Bool?
    /// - Remark: Generated from `#/components/schemas/Options/is_scim`.
    public var isScim: Swift.Bool?
    /// Creates a new `Options`.
    ///
    /// - Parameters:
    ///   - isProtected:
    ///   - isScim:
    public init(
        isProtected: Swift.Bool? = nil,
        isScim: Swift.Bool? = nil
    ) {
        self.isProtected = isProtected
        self.isScim = isScim
    }
    public enum CodingKeys: String, CodingKey {
        case isProtected = "is_protected"
        case isScim = "is_scim"
    }
}
