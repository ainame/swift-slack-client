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

/// - Remark: Generated from `#/components/schemas/Team`.
public struct Team: Codable, Hashable, Sendable {
    /// - Remark: Generated from `#/components/schemas/Team/name`.
    public var name: Swift.String?
    /// - Remark: Generated from `#/components/schemas/Team/id`.
    public var id: Swift.String?
    /// Creates a new `Team`.
    ///
    /// - Parameters:
    ///   - name:
    ///   - id:
    public init(
        name: Swift.String? = nil,
        id: Swift.String? = nil
    ) {
        self.name = name
        self.id = id
    }
}
