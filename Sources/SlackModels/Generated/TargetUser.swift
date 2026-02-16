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

/// - Remark: Generated from `#/components/schemas/TargetUser`.
public struct TargetUser: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/TargetUser/recipient_email`.
    public var recipientEmail: Swift.String?
    /// Creates a new `TargetUser`.
    ///
    /// - Parameters:
    ///   - recipientEmail:
    public init(recipientEmail: Swift.String? = nil) {
        self.recipientEmail = recipientEmail
    }

    public enum CodingKeys: String, CodingKey {
        case recipientEmail = "recipient_email"
    }
}
