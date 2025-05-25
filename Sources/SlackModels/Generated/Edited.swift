#if os(Linux)
#else
import struct Foundation.URL
import struct Foundation.Data
import struct Foundation.Date
#endif
#endif
#endif
#if canImport(SlackBlockKit)
import SlackBlockKit

/// - Remark: Generated from `#/components/schemas/Edited`.
public struct Edited: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Edited/user`.
    public var user: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Edited/ts`.
    public var ts: Swift.String?
    /// Creates a new `Edited`.
    ///
    /// - Parameters:
    ///   - user:
    ///   - ts:
    public init(
        user: Swift.String? = nil,
        ts: Swift.String? = nil
    ) {
        self.user = user
        self.ts = ts
    }
}
