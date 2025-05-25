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
