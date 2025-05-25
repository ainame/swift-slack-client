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

/// - Remark: Generated from `#/components/schemas/UsergroupClude`.
public struct UsergroupClude: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/UsergroupClude/id`.
    public var id: Swift.String?
    /// - Remark: Generated from `#/components/schemas/UsergroupClude/teamId`.
    public var teamId: Swift.String?
    /// Creates a new `UsergroupClude`.
    ///
    /// - Parameters:
    ///   - id:
    ///   - teamId:
    public init(
        id: Swift.String? = nil,
        teamId: Swift.String? = nil
    ) {
        self.id = id
        self.teamId = teamId
    }
}
