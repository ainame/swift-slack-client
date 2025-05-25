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

/// - Remark: Generated from `#/components/schemas/DmMpdmUsersWithFileAccess`.
public struct DmMpdmUsersWithFileAccess: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/DmMpdmUsersWithFileAccess/access`.
    public var access: Swift.String?
    /// - Remark: Generated from `#/components/schemas/DmMpdmUsersWithFileAccess/userId`.
    public var userId: Swift.String?
    /// Creates a new `DmMpdmUsersWithFileAccess`.
    ///
    /// - Parameters:
    ///   - access:
    ///   - userId:
    public init(
        access: Swift.String? = nil,
        userId: Swift.String? = nil
    ) {
        self.access = access
        self.userId = userId
    }
}
