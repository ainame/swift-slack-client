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

/// - Remark: Generated from `#/components/schemas/TargetUser`.
public struct TargetUser: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/TargetUser/recipientEmail`.
    public var recipientEmail: Swift.String?
    /// Creates a new `TargetUser`.
    ///
    /// - Parameters:
    ///   - recipientEmail:
    public init(recipientEmail: Swift.String? = nil) {
        self.recipientEmail = recipientEmail
    }
}
