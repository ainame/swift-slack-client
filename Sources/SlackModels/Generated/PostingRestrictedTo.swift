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

/// - Remark: Generated from `#/components/schemas/PostingRestrictedTo`.
public struct PostingRestrictedTo: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/PostingRestrictedTo/type`.
    public var type: [Swift.String]?
    /// - Remark: Generated from `#/components/schemas/PostingRestrictedTo/user`.
    public var user: [Swift.String]?
    /// Creates a new `PostingRestrictedTo`.
    ///
    /// - Parameters:
    ///   - type:
    ///   - user:
    public init(
        type: [Swift.String]? = nil,
        user: [Swift.String]? = nil
    ) {
        self.type = type
        self.user = user
    }
}
